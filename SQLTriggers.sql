CREATE TRIGGER checkUserOrder ON WEB_ORDER
INSTEAD OF INSERT
AS
	declare @order_id int;
	declare @user_email varchar(30);

	select @order_id = i.Order_ID from inserted i;
	select @user_email = i.User_email from inserted i;

	BEGIN
		if(@user_email IS NULL OR @order_id IS NULL)
		begin
			RAISERROR('Cannot add to table if order_id or user_email is null', 16, 1);
			ROLLBACK;
		end
		else
		begin
			select @user_email = inserted.user_email
			from CREDIT_CARD AS c, inserted
			WHERE
			c.user_email = inserted.user_email;

		if(@user_email IS NULL)
		begin 
			RAISERROR('Cannot add to table if user does not have credit card', 16, 1);
			ROLLBACK;
		end
	else
		begin
insert into U_PLACES
		(User_email, Order_ID)
		values(@user_email, @order_id);
				
		insert into WEB_ORDER
		(Order_ID, OCost, User_email, Disp_ID)
		select @order_id, OCost, @user_email, Disp_ID
		from inserted;
		end
		end
	END
GO
CREATE TRIGGER checkProductType ON PRODUCT
INSTEAD OF INSERT
AS
	declare @product_type float;
	select @product_type = i.Product_ID from inserted i;

	BEGIN
		
		if(@product_type IS NULL OR @product_type > 99999999 OR @product_type < 10000000)
		Begin
			RAISERROR('Cannot add to table if product is not computer, computer mouse, or television', 16, 1);
		ROLLBACK;
	End
	else
	Begin
		Insert into PRODUCT
		(Product_ID, Product_Name, Price, PManufacturer_ID)
		Select @product_type, Product_Name, Price, PManufacturer_ID
		From inserted;
	End
END
GO