--|����� ����������� - 200 ������|--
SELECT TOP 200 [SotrudNo]
      ,[SotrudName]
      ,[SotrudOtdel]
  FROM [work].[dbo].[Sotrud]
  order by [SotrudNo]


--|����� ������� - 200 ������|--
SELECT TOP 200 [TovarNo]
      ,[NameTovarShort]
  FROM [work].[dbo].[Tovar]


--|���� ���������|--
SELECT TOP 100 [VidNaklNo]
      ,[VidNaklName]
      ,[VidZatrat]
  FROM [work].[dbo].[VidNakl]

