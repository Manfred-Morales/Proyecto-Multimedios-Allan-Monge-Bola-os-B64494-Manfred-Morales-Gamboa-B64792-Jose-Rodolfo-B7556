use marketsaveus
go

create or alter trigger [TR_UPDATE_STOCK]
on TblDescInvoice after insert
as
	declare @stock int, @quantity int, @code varchar(20)
	begin
		set @stock = (select p.stock from inserted i, TblProduct p  where p.code = i.productCode)
		set @code = (select p.code from inserted i, TblProduct p  where p.code = i.productCode)
		set @quantity = (select quantity from inserted)
		if @stock >= @quantity
		begin
			update TblProduct set stock = stock-@quantity where @code = code
		end
	end
go