
  
IF EXISTS (SELECT name FROM [dbo].sysobjects 
         WHERE name = 'p_Product_Info' AND type = 'P')
   DROP PROCEDURE [dbo].p_Product_Info
GO
  
  
create PROCEDURE [dbo].p_Product_Info
	@id int,
	@ma_san_pham [varchar](255),
	@ma_loai_san_pham [varchar](255),
	@ten_san_pham [varchar](255),
	@mo_ta [varchar](255),
	@tu_khoa [varchar](255),
	@tag [varchar](255),
	@slug [varchar](255),
	@trong_so int,
	@nguoi_duyet [varchar](255),
	@ngay_duyet datetime,
	@trang_thai_duyet [varchar](255),
	@nguoi_xuat_ban [varchar](255),
	@ngay_xuat_ban datetime,
	@trang_thai_xuat_ban [varchar](255),
	@trang_thai [varchar](255),
	@ngay_tao datetime,
	@nguoi_tao [varchar](100),
	@ngay_cap_nhat datetime,
	@nguoi_cap_nhat [varchar](100),
	@url [varchar](255),
	@Type [varchar](50),
	@IsSync int = 0
AS
BEGIN
	
	if(@Type = 'Insert')
	begin
		insert into Product_Info(ma_san_pham,ma_loai_san_pham,ten_san_pham,mo_ta,tu_khoa,tag,slug,trong_so,nguoi_duyet,ngay_duyet,
		trang_thai_duyet,nguoi_xuat_ban,ngay_xuat_ban,trang_thai_xuat_ban,trang_thai,ngay_tao,nguoi_tao,ngay_cap_nhat,
		nguoi_cap_nhat,url)
		values (@ma_san_pham,@ma_loai_san_pham,@ten_san_pham,@mo_ta,@tu_khoa,@tag,@slug,@trong_so,@nguoi_duyet,@ngay_duyet,
		@trang_thai_duyet,@nguoi_xuat_ban,@ngay_xuat_ban,@trang_thai_xuat_ban,@trang_thai,@ngay_tao,@nguoi_tao,@ngay_cap_nhat,
		@nguoi_cap_nhat,@url)

	    /*
		INSERT INTO openquery(MYSQL,'select ma_san_pham,ma_loai_san_pham,ten_san_pham,mo_ta,trong_so,nguoi_duyet,ngay_duyet,
		trang_thai_duyet,trang_thai,ngay_tao,nguoi_tao,ngay_cap_nhat,
		nguoi_cap_nhat from product_info')
		values (@ma_san_pham,@ma_loai_san_pham,@ten_san_pham,@mo_ta,@trong_so,@nguoi_duyet,@ngay_duyet,
		@trang_thai_duyet,@trang_thai,@ngay_tao,@nguoi_tao,@ngay_cap_nhat,
		@nguoi_cap_nhat)*/
	end

	if(@Type = 'Update')
	begin
		update Product_Info
		set ma_san_pham=@ma_san_pham,ma_loai_san_pham=@ma_loai_san_pham,ten_san_pham=@ten_san_pham,
		mo_ta=@mo_ta,tu_khoa=@tu_khoa,tag=@tag,slug=@slug,trong_so=@trong_so,nguoi_duyet=@nguoi_duyet,ngay_duyet=@ngay_duyet,
		trang_thai_duyet=@trang_thai_duyet,nguoi_xuat_ban=@nguoi_xuat_ban,ngay_xuat_ban=@ngay_xuat_ban,
		trang_thai_xuat_ban=@trang_thai_xuat_ban,trang_thai=@trang_thai,ngay_cap_nhat=@ngay_cap_nhat,
		nguoi_cap_nhat=@nguoi_cap_nhat,url=@url
		where id=@id

		/*update openquery(MYSQL, 'SELECT * FROM product_info')
		set ma_san_pham=@ma_san_pham,ma_loai_san_pham=@ma_loai_san_pham,ten_san_pham=@ten_san_pham,
		mo_ta=@mo_ta,trong_so=@trong_so,nguoi_duyet=@nguoi_duyet,ngay_duyet=@ngay_duyet,
		trang_thai_duyet=@trang_thai_duyet,trang_thai=@trang_thai,ngay_cap_nhat=@ngay_cap_nhat,
		nguoi_cap_nhat=@nguoi_cap_nhat
		WHERE id =@ID*/
	end 

	if (@IsSync =1)
	begin
		
		if not exists (select * from openquery(MYSQL,'select * from bibiam_dev.product_info') where ma_san_pham=@ma_san_pham)
		begin
				INSERT INTO openquery(MYSQL,'select ma_san_pham,ma_loai_san_pham,ten_san_pham,mo_ta,tu_khoa,tag,slug,trong_so,nguoi_duyet,ngay_duyet,
				trang_thai_duyet,nguoi_xuat_ban,ngay_xuat_ban,trang_thai_xuat_ban,trang_thai,ngay_tao,nguoi_tao,ngay_cap_nhat,
				nguoi_cap_nhat,url from bibiam_dev.product_info')
				values (@ma_san_pham,@ma_loai_san_pham,@ten_san_pham,@mo_ta,@tu_khoa,@tag,@slug,@trong_so,@nguoi_duyet,@ngay_duyet,
				@trang_thai_duyet,@nguoi_xuat_ban,@ngay_xuat_ban,@trang_thai_xuat_ban,@trang_thai,@ngay_tao,@nguoi_tao,@ngay_cap_nhat,
				@nguoi_cap_nhat,@url)
		end
		else
		begin
			update openquery(MYSQL, 'SELECT * FROM product_info')
			set ma_loai_san_pham=@ma_loai_san_pham,ten_san_pham=@ten_san_pham,
			mo_ta=@mo_ta,tu_khoa=@tu_khoa,tag=@tag,slug=@slug,trong_so=@trong_so,nguoi_duyet=@nguoi_duyet,ngay_duyet=@ngay_duyet,
			trang_thai_duyet=@trang_thai_duyet,nguoi_xuat_ban=@nguoi_xuat_ban,ngay_xuat_ban=@ngay_xuat_ban,
			trang_thai_xuat_ban=@trang_thai_xuat_ban,trang_thai=@trang_thai,ngay_cap_nhat=@ngay_cap_nhat,
			nguoi_cap_nhat=@nguoi_cap_nhat,url=@url
			WHERE ma_san_pham=@ma_san_pham
		end
	end
	
END
