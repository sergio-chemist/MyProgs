--|Выбор сотрудников - 200 первых|--
SELECT TOP 200 [SotrudNo]
      ,[SotrudName]
      ,[SotrudOtdel]
  FROM [work].[dbo].[Sotrud]
  order by [SotrudNo]


--|Выбор товаров - 200 первых|--
SELECT TOP 200 [TovarNo]
      ,[NameTovarShort]
  FROM [work].[dbo].[Tovar]


--|Виды накладных|--
SELECT TOP 100 [VidNaklNo]
      ,[VidNaklName]
      ,[VidZatrat]
  FROM [work].[dbo].[VidNakl]


--|Список заказов - [e_blank_head]|--
/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
SELECT TOP 100 [ID]
      ,[PostNo]
      ,[DateNakl]
      ,[SotrudNo]
      ,[Buh]
      ,[VidNaklNo]
      ,[UserNo]
      ,[AddressNo]
      ,[OtdelNo]
      ,[ColnPrice]
      ,[KolDayPlan]
      ,[Status]
      ,[SubNum]
      ,[DateCorrelation]
      ,[CreateDate]
      ,[weight]
      ,[summa]
      ,[EditUserNo]
      ,[ReasonId]
      ,[ParentId]
      ,[VidtovGroupId]
      ,[description]
      ,[ExpeditionNo]
      ,[InCar]
      ,[contract_id]
      ,[OurFirmNo]
      ,[rowid]
      ,[reserve]
      ,[CurrencyHead]
      ,[IsVeb]
  FROM [work].[dbo].[e_blank_head]



--|Список заказов - [e_blanks]|--
/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
SELECT TOP 100 [ID]
      ,[Document_id]
      ,[TovarNo]
      ,[Boss_price]
      ,[weight]
      ,[KolOrd]
      ,[DateNakl]
      ,[status]
      ,[CreateUser]
      ,[LastEditUser]
      ,[KolBegin]
      ,[AvgPriceIn]
      ,[RasNo]
      ,[KolOst]
      ,[vidNaklNo]
      ,[reserve]
      ,[price_type_id]
      ,[Residue]
      ,[Need]
      ,[Currency]
      ,[Rate]
      ,[CrossPrice]
      ,[PaymentPrice]
      ,[BossPriceFirst]
  FROM [work].[dbo].[e_blanks]


--|Список заказов - dbo.v_blanklist |--
SELECT TOP 100 [ID]
      ,[Document_Id]
      ,[Num]
      ,[DateNakl]
      ,[SubNum]
      ,[PostNo]
      ,[Postname]
      ,[Postdaydelay]
      ,[SotrudNo]
      ,[Sotrudname]
      ,[Buh]
      ,[Buhname]
      ,[VidNaklNo]
      ,[Vidnaklname]
      ,[UserNo]
      ,[Username]
      ,[AddressNo]
      ,[Address]
      ,[OtdelNo]
      ,[Otdelname]
      ,[ColnPrice]
      ,[Colnpricename]
      ,[KolDayPlan]
      ,[Status]
      ,[Statusname]
      ,[summa]
      ,[Sumkol]
      ,[weight]
      ,[DateCorrelation]
      ,[CreateDate]
      ,[Is_Read_Only]
      ,[reserve]
      ,[ReasonId]
      ,[Reasonname]
      ,[Rashoddatenakl]
      ,[Rashodnom]
      ,[NaklNo]
      ,[Rashodnum]
      ,[Summain]
      ,[ExpeditionNo]
      ,[ParentId]
      ,[VidtovGroupId]
      ,[Vidtovgroupname]
      ,[description]
      ,[Day_Of_Week]
      ,[InCar]
      ,[contract_id]
      ,[Contract_Description]
      ,[RegionNo]
      ,[Regionname]
      ,[OurFirmNo]
      ,[rowid]
      ,[TypeReturn]
      ,[TimeCreate]
      ,[IdVeb]
      ,[DescriptionOrderVeb]
      ,[CurrencyHead]
      ,[IsVeb]
  FROM [work].[dbo].[V_blankList]
 order by a.DateNakl desc


--|Список расходных накладных|--
SELECT TOP 100 [NaklNo]
      ,[Nom]
      ,[NomFirst]
      ,[NomReturn]
      ,[PostNo]
      ,[PostNoFirst]
      ,[PostNoReturn]
      ,[DateNakl]
      ,[DateNaklFirst]
      ,[Summa]
      ,[SummaDolg]
      ,[SotrudNo]
      ,[DateOpl]
      ,[RealDateOpl]
      ,[Buh]
      ,[VidNaklNo]
      ,[UserNo]
      ,[ColnPrice]
      ,[Ask]
      ,[AddressNo]
      ,[ExpeditionNo]
      ,[Weight]
      ,[KolPerPak]
      ,[InCar]
      ,[Change1C]
      ,[Export1C]
      ,[ID1C]
      ,[OtdelNo]
      ,[Svedenie]
      ,[is_check_first]
      ,[id]
      ,[AddressNoFirst]
      ,[contract_id]
      ,[edit_status_id]
      ,[description]
      ,[OurFirmNo]
      ,[dept_id]
      ,[num]
      ,[sub_num]
      ,[doc_type_id]
      ,[pkey]
      ,[SET_ARTICLE_GROUP_ID]
      ,[OrderInFlight]
      ,[ArrivalTime]
      ,[CurrencyHead]
      ,[CurrencyAccounting]
      ,[SummaCurrencyAccounting]
      ,[SummaDolgCurrencyAccounting]
      ,[RateCurrencyAccounting]
  FROM [work].[dbo].[NaklR]
order by [DateNaklFirst] desc

--|dbo.v_blanklist - структура запроса|--
SELECT     b.ID, b.ID AS Document_Id, 'r.' + CONVERT(Char(10), 
b.DateNakl, 104) + '-' + CAST(b.SubNum AS varchar) AS Num, 
b.DateNakl, b.SubNum, b.PostNo, p.Name AS Postname, ISNULL
(p.DayDelay, 0) 
                      AS Postdaydelay, b.SotrudNo,
                          (SELECT     SotrudName
                            FROM          dbo.Sotrud
                            WHERE      (SotrudNo = b.SotrudNo)) 
AS Sotrudname, b.Buh,
                          (SELECT     Buh_type_name
                            FROM          dbo.d_buh_type
                            WHERE      (buh = b.Buh)) AS 
Buhname, b.VidNaklNo,
                          (SELECT     VidNaklName
                            FROM          dbo.VidNakl
                            WHERE      (VidNaklNo = 
b.VidNaklNo)) AS Vidnaklname, b.UserNo,
                          (SELECT     UserName
                            FROM          dbo.Users
                            WHERE      (UserNo = b.UserNo)) AS 
Username, b.AddressNo, Ap.Address, b.OtdelNo,
                          (SELECT     OtdelName
                            FROM          dbo.VidOtdel
                            WHERE      (OtdelNo = b.OtdelNo)) 
AS Otdelname, b.ColnPrice,
                          (SELECT     ColName
                            FROM          dbo.D_Price_type
                            WHERE      (ColNPrice = 
b.ColnPrice)) AS Colnpricename, b.KolDayPlan, b.Status,
                          (SELECT     status_name
                            FROM          dbo.d_status
                            WHERE      (status = b.Status)) AS 
Statusname, b.summa,
                          (SELECT     SUM(KolOrd) AS Expr1
                            FROM          dbo.e_blanks
                            WHERE      (Document_id = b.ID)) AS 
Sumkol, b.weight, b.DateCorrelation, b.CreateDate, CASE WHEN 
b.Reserve = 1 OR
                      b.Status = 0 THEN 0 ELSE 1 END AS 
Is_Read_Only, b.reserve, b.ReasonId,
                          (SELECT     ReasonName
                            FROM          dbo.d_blank_reason
                            WHERE      (id = b.ReasonId)) AS 
Reasonname, ISNULL(r.DateNakl, b.DateNakl) AS Rashoddatenakl, 
r.Nom AS Rashodnom, r.NaklNo, 'r.' + CONVERT(Char(10), ISNULL
(r.DateNakl, b.DateNakl), 104) 
                      + '-' + CAST(ISNULL(r.Nom, b.SubNum) AS 
varchar) AS Rashodnum,
                          (SELECT     ROUND(SUM(ROUND
(AvgPriceIn * ISNULL(KolOrd, 0), 3)), 2) AS Expr1
                            FROM          dbo.e_blanks AS 
e_blanks_1
                            WHERE      (Document_id = b.ID)) AS 
Summain, b.ExpeditionNo, b.ParentId, b.VidtovGroupId,
                          (SELECT     NAME
                            FROM          
dbo.D_SET_ARTICLE_GROUP
                            WHERE      (ID = b.VidtovGroupId)) 
AS Vidtovgroupname, b.description, DATEPART(Dw, b.DateNakl) AS 
Day_Of_Week, b.InCar, b.contract_id,
                          (SELECT     Description
                            FROM          dbo.d_firm_contract 
AS v
                            WHERE      (id = b.contract_id)) AS 
Contract_Description, Ap.RegionNo,
                          (SELECT     RegionName
                            FROM          dbo.Regions
                            WHERE      (RegionNo = 
Ap.RegionNo)) AS Regionname, b.OurFirmNo, b.rowid,
                          (SELECT     TypeReturnName
                            FROM          dbo.D_TypeReturn
                            WHERE      (TypeReturnNo = 
l.TypeReturnNo)) AS TypeReturn,
                          (SELECT DISTINCT cbws.TimeCreate
                            FROM          
dbo.CreateBlancWithSite AS cbws LEFT OUTER JOIN
                                                   
dbo.l_BlankForVeb AS lbv ON lbv.IdVeb = cbws.OrderVeb
                            WHERE      (lbv.idBlank = b.ID)) AS 
TimeCreate, ISNULL(CONVERT(varchar, lb.IdVeb), 'Создано в 
ручную') AS IdVeb, dov.DescriptionOrderVeb, b.CurrencyHead, 
b.IsVeb
FROM         dbo.e_blank_head AS b INNER JOIN
                      dbo.Post AS p ON b.PostNo = p.PostNo LEFT 
OUTER JOIN
                      dbo.AddressPost AS Ap ON Ap.PostNo = 
b.PostNo AND Ap.AddressNo = b.AddressNo LEFT OUTER JOIN
                      dbo.NaklR AS r ON r.pkey = b.rowid LEFT 
OUTER JOIN
                      dbo.L_BlankReturn AS l ON l.Document_id = 
b.ID LEFT OUTER JOIN
                      dbo.l_BlankForVeb AS lb ON lb.idBlank = 
b.ID LEFT OUTER JOIN
                      dbo.DescriptionsOrdersVeb AS dov ON 
dov.IdBlank = b.ID

--|Последние 100 заказов|--
SELECT top 100 b.ID, b.DateNakl, b.KolDayPlan, b.weight
FROM dbo.e_blank_head AS b
where b.VidNaklNo=1
order by b.DateNakl desc

--|Список документов - 100 последних|--
SELECT TOP 100 [ID]
      ,[ORDER_NUM]
      ,[ARTICLE_ID]
      ,[QTY]
      ,[PRICE_ECO]
      ,[DOC_DATE]
      ,[DOC_TYPE_ID]
      ,[DHEAD_ID]
      ,[ENTITY_TYPE]
      ,[IS_FRACTION]
      ,[OUR_FIRM_ID]
      ,[PRICE_ECO_IN]
      ,[DEPT_ID]
      ,[CONTRACTOR_ID]
      ,[QTY_PAY]
      ,[QTY_FIRST]
      ,[CreateUser]
      ,[LastEditUser]
      ,[blank_id]
      ,[NaklNo]
      ,[CONTRACTOR_ACC_ID]
      ,[MANAGER_DEPT_ID]
      ,[STATE_ID]
      ,[OUT_TRADE_ID]
      ,[TRIP_ID]
      ,[QTY_FIT]
      ,[MANAGER_ID]
      ,[row_version]
      ,[PRICE_TYPE_ID]
      ,[DateOfManufacture]
      ,[Currency]
      ,[PaymentPrice]
  FROM [work].[dbo].[DSPEC]
ORDER BY [DOC_DATE] DESC

--|Список док-тов краткий - 100 последних|--
SELECT TOP 100 [ID]
      ,[ORDER_NUM]
      ,[ARTICLE_ID]
      ,[QTY]
      ,[PRICE_ECO]
      ,[DOC_DATE]
      ,[blank_id]
      ,[NaklNo]
      ,[QTY_FIT]     
  FROM [work].[dbo].[DSPEC]
  ORDER BY [DOC_DATE] DESC



--|Список заказов c именами товаров|--
SELECT TOP 100 d.[ID] d_id, b.[ID] b_id
      ,[ORDER_NUM]
      ,[ARTICLE_ID]
      , (select [NameTovarShort] from [work].[dbo].[Tovar] t
         where t.TovarNo=d.[ARTICLE_ID]) as NameTovar 
      ,[QTY]
      ,[PRICE_ECO]
      ,[DOC_DATE]
      ,[blank_id]
      ,[NaklNo]
      ,[QTY_FIT]     
  FROM [work].[dbo].[DSPEC] d, [work].[dbo].[e_blank_head] b
  where d.[blank_id]=b.ID
  ORDER BY [DOC_DATE] DESC

--|Список расходных накладных - последние 100|--
SELECT TOP 100 [NaklNo]
      ,[Nom]
      ,[DateNakl]
      ,[DateNaklFirst]
      ,[VidNaklNo]
      ,[UserNo]
      ,[ColnPrice]
      ,[Ask]
      ,[Weight]
      ,[id]
      ,[pkey]
      ,[SET_ARTICLE_GROUP_ID]
  FROM [work].[dbo].[NaklR]
  order by [DateNakl] desc

--|Список заказов - с накладными - посл. 100|--
SELECT TOP 100 d.[ID] d_id, b.[ID] b_id
      ,[ARTICLE_ID]
      , (select [NameTovarShort] from [work].[dbo].[Tovar] t
         where t.TovarNo=d.[ARTICLE_ID]) as NameTovar 
      ,[QTY] as qty_nakl
      ,[QTY_FIRST]
      , [QTY_FIT]
      ,d.[NaklNo]
      ,[PRICE_ECO]
      ,[DOC_DATE]
      ,[blank_id]          
  FROM [work].[dbo].[DSPEC] d, [work].[dbo].[e_blank_head] b, 
[work].[dbo].[NaklR] n
  where (d.[blank_id]=b.ID) and (d.[NaklNo]= n.NaklNo) and 
([QTY_FIRST]<[QTY_FIT])  
ORDER BY [DOC_DATE] DESC


