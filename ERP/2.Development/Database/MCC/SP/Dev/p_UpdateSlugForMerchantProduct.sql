IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_UpdateSlugForMerchantProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[p_UpdateSlugForMerchantProduct]
GO

  
--p_UpdateSlugForMerchantProduct 2019
CREATE PROC [dbo].[p_UpdateSlugForMerchantProduct]
@id int
as
begin
	
	/*select ROW_NUMBER() OVER(PARTITION BY [dbo].[fuChuyenCoDauThanhKhongDau](ten_san_pham) ORDER BY id ASC) AS Row#,
	REPLACE([dbo].[fuChuyenCoDauThanhKhongDau](ten_san_pham),'/','') as Slug
	,id 
	into #tmpMerchant_Product
	from Merchant_Product
	where [dbo].[fuChuyenCoDauThanhKhongDau](ten_san_pham) in
	(
		select [dbo].[fuChuyenCoDauThanhKhongDau](ten_san_pham) as Slug from Merchant_Product
		where id=@id
		--where [dbo].[fuChuyenCoDauThanhKhongDau](ten_san_pham)='3NA3-LV-HRC-fuse-link'
	)

	update #tmpMerchant_Product
	set Slug=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Slug,'?',''),'}',''),'{',''),'=',''),'!',''),'*',''),'^',''),'%',''),'$',''),',',''),'@','')
	
	if(select count(1) from #tmpMerchant_Product) > 1
	begin
		update a
		set a.slug = b.Slug + '-' + cast(b.Row# as varchar(10)), 
		a.tag = b.Slug + '-' + cast(b.Row# as varchar(10))
		from Merchant_Product a
		join #tmpMerchant_Product b
		on a.id = b.id
	end
	else
	begin
		update a
		set a.slug = b.Slug, a.tag=b.Slug
		from Merchant_Product a
		join #tmpMerchant_Product b
		on a.id = b.id
	end*/

	update Merchant_Product
	set Slug=REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([dbo].[fuChuyenCoDauThanhKhongDau](ten_san_pham),'/',''),'?',''),'}',''),'{',''),'=',''),'!',''),'*',''),'^',''),'%',''),'$',''),',',''),'@','') + '-' + 
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([dbo].[fuChuyenCoDauThanhKhongDau](part_no),'/',''),'?',''),'}',''),'{',''),'=',''),'!',''),'*',''),'^',''),'%',''),'$',''),',',''),'@','')
	where id=@id
end
