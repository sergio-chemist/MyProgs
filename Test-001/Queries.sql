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

