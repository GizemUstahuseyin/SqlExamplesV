--1."Categories" tablosundan CategoryName alan�na g�re artan s�rada olacak �ekilde CatogoryName ve Description bilgilerini veren sorguyu olu�turunuz.
SELECT CategoryName, Description
FROM Categories
ORDER BY CategoryName ASC

--2."Customers" tablosundan CompanyName,ContactName,"Ki�iAd�, �irketAd�,ContactTitle ve Phone bilgilerini Phone bilgisine g�re artan s�rada olacak �ekilde g�steren sorguyu olu�turunuz.
SELECT CompanyName,ContactName,ContactTitle,Phone
FROM Customers
ORDER BY Phone ASC

--3."Employees" tablosundan i�e ba�lama tarihi ("HireDate") alan�na g�re azalan s�rada olacak �ekilde FirstName ve b�y�k harfli olacak LastName alanlar�n� aras�nda bir bo�luk karakteri olmak �zere olu�turan sorguyu olu�turunuz.

SELECT HireDate,FirstName + ' ' + UPPER (LastName) AS "NameLastName"
FROM Employees
ORDER BY HireDate DESC

--4."Orders" tablosundan OrderID, OrderDate, ShippedDate, CustomerID, Freight bilgilerini Freight alan�na g�re azalan s�rada olacak �ekilde ilk 10 kay�d� g�steren sorguyu olu�turunuz.

SELECT OrderID,OrderDate,ShippedDate,CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
Select TOP 10 * From Orders

--5. "Customers" tablosundan t�m "CustomerID" bilgilerini k���k harfle g�steren ve bunu "Kimlik Tnm" olarak yeniden adland�ran bir sorgu olu�turunuz.

SELECT + LOWER (CustomerID) AS KimlikTnm
FROM Customers 

--6. "Suppliers" tablosundan Country bilgisi azalan s�rada, CompanyName artan s�rada olacak �ekilde CompanyName, Fax, Phone, Country bilgilerini d�ken bir sorgu olu�turunuz.

SELECT Country , Fax , Phone , CompanyName 
FROM Suppliers
ORDER BY  Country DESC, CompanyName

--7. "Customers" tablosundan yaln�zca 'Buenos Aires'ten gelen t�m m��terilerin CompanyName, ContactName'lerini g�steren bir sorgu olu�turunuz.

SELECT CompanyName, ContactName, City
FROM Customers
WHERE City = 'Buenos Aires'

--8. "Products" tablosundan stokta olmayan �r�nlerin ProductName, UnitPrice, QuantityPerUnit bilgilerini g�steren bir sorgu olu�turunuz.

SELECT ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
FROM Products
WHERE UnitsInStock=0

--9. Almanya, Meksika, �spanya'dan olmayan t�m m��terilerin(Customers) CompanyName,Address,City,Country bilgilerini g�steren bir sorgu olu�turunuz.

Select CompanyName,Address,City,Country
FROM Customers
WHERE Country NOT IN ('Germany','Mexico','Spain')

--10. 21 May�s 1996'da verilen t�m sipari�lerin OrderDate,ShippedDate, CustomerID ve Freight bilgilerini g�steren bir sorgu olu�turunuz.

SELECT OrderDate,ShippedDate, CustomerID,Freight
FROM Orders
WHERE OrderDate = 1996-05-21

--11. Amerika Birle�ik Devletleri'nden olmayan �al��anlar�n FirstName,LastName,Country bilgilerini g�steren bir sorgu olu�turunuz.

SELECT FirstName,LastName,Country
FROM Employees
WHERE Country NOT IN ('USA')

--13. Ba� harfi A veya B ile ba�layan �ehirlerdeki m��terilerin City, CompanyName, ContactName bilgilerini g�steren bir sorgu olu�turunuz.

SELECT City,CompanyName,ContactName
FROM Customers
WHERE City LIKE '[AB]%';

--14. Navlun(Freight) maliyetinin 500 dolardan fazla oldu�u t�m sipari�leri(Orders) g�steren bir sorgu olu�turunuz.

SELECT Freight
FROM ORDERS
WHERE Freight > 500

--15. Faks numaras� olmayan t�m m��terilerin CompanyName, ContactName bilgilerini g�steren bir sorgu olu�turunuz.

SELECT CompanyName,ContactName
FROM Customers
WHERE Fax IS NULL

--16. Kimseye rapor vermeyen(ReportsTo alan�) �al��anlar�n FirstName, LastName bilgilerini g�steren bir sorgu olu�turunuz.

SELECT  FirstName,LastName
FROM Employees
WHERE ReportsTo IS NULL

--17. Ad�nda L harfi olan �ehirlerdeki m��terilerin City,CompanyName,ContactName bilgilerini ContactName bilgisi azalacak �ekilde g�steren bir sorgu olu�turunuz.

SELECT City,CompanyName,ContactName
FROM Customers
WHERE City LIKE '%L%'
ORDER BY ContactName DESC

--18. 1950'lerde do�an �al��anlar�n(Employee tablosu) FirstName, LastName, BirthDate bilgilerini g�steren bir sorgu olu�turunuz.

SELECT FirstName,LastName,BirthDate
FROM Employees
WHERE BirthDate LIKE '%195%'

--19. Exotic Liquids, Specialty Biscuits Ltd., Escargots Nouveaux tedarik�ileri taraf�ndan sa�lanan t�m �r�nlerin tedarik�i kimli�ine g�re s�ralanm�� olarak SupplierID, ProductName ve CompanyName bilgilerini g�steren sorgu olu�turunuz.

SELECT s.SupplierID, p.ProductName, S.CompanyName
FROM Suppliers s
JOIN Products p
ON s.SupplierID = p.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY s.SupplierID;

--20. "Seattle" �ehrindeki �al��anlar�n LastName,FirstName bilgilerini g�steren bir sorgu olu�turunuz

SELECT LastName,FirstName
FROM Employees
WHERE City = 'Seattle'

--21. Madrid d���nda Meksika'daki herhangi bir �ehirdeki veya �spanya'daki di�er �ehirlerdeki t�m m��terilerin CompanyName,ContactName, City ve Country bilgilerini g�steren bir sorgu olu�turunuz.

SELECT CompanyName,ContactName,City,Country
FROM Customers
WHERE City! = 'Madrid' and Country ='Spain' or Country ='Mexico'


--22.�kinci karakterinde A harfi olmayan t�m m��terilerin ContactName bilgisini azalan s�rada g�steren bir sorgu olu�turunuz.

SELECT ContactName
FROM Customers
WHERE ContactName NOT LIKE '_A%'
ORDER BY ContactName DESC

--23. Orders tablosundan Freight toplam� 200$'dan b�y�k olan bilgilerin CustomerID ve Freight toplam�n� g�steren bir sorgu olu�turunuz.(�PUCU: GroupBy ve Having deyimi kullanman�z gerekecek.)

SELECT CustomerID, sum(Freight) TotalFreight
FROM Orders
GROUP BY CustomerID
HAVING sum(Freight) > 200; 

--24. �al��anlar tablosundan �al��an Kimli�i, �al��an�n Soyad� ve Ad� ve y�netici olarak rapor verdikleri ki�inin Soyad� ve Ad�'n� g�steren bir sorgu olu�turunuz. (�P�NUCU : Self Join)

SELECT a.EmployeeID,
CONCAT (a.LastName, ' ' ,a.FirstName ) AS Employee,
CONCAT (b.LastName,' ', b.FirstName ) AS Manager
FROM Employees a
LEFT JOIN Employees b
ON b.EmployeeID = a.ReportsTo
ORDER BY a.EmployeeID;

--25. T�m �r�nlerin(Products) BirimFiyat�n�(UnitPrice) ortalama(AVG), minimum(MIN) ve maksimum(MAX) de�erlerini OrtalamaFiyat, MinimumFiyat,MaksimumFiyat olarak g�steren bir sorgu olu�turunuz.

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) AS 'Minimum Fiyat' FROM Products) OR UnitPrice = (SELECT MAX(UnitPrice)  AS 'Maximum Fiyat' FROM Products) OR UnitPrice = (SELECT AVG(UnitPrice)  AS 'Ortalama Fiyat' FROM Products)
GROUP BY ProductName, UnitPrice;

--26. "Categories" tablosundan CategoryName bilgisinin ilk 5 karakterini getiren(LEFT fonksiyonu) ve K�saBilgi olarak yeniden adland�r�lan bir sorgu olu�turunuz.

SELECT LEFT(CategoryName,5) 
FROM Categories

--27. Deniz �r�nleri kategorisindeki t�m �r�nlerden �irketAd� ve �r�nAd�n� listeleyen bir sorgu olu�turunuz.

SELECT S.CompanyName, P.ProductName
FROM Products P 
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
INNER JOIN Suppliers S ON S.SupplierID = P.SupplierID
WHERE C.CategoryName = 'Seafood';

--28. CategoryID'si 5 olan t�m �r�nlerden CategoryID, CompanyName ve ProductName bilgilerini listeleyen bir sorgu olu�turunuz.

SELECT S.CompanyName, P.ProductName, C.CategoryID
FROM Products P 
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
INNER JOIN Suppliers S ON S.SupplierID = P.SupplierID
WHERE C.CategoryID = 5;

--29. ContactTitle alan�nda 'Owner' ge�en m��terilerimin �irket adlar�n� listeleyiniz.

SELECT CompanyName
FROM Customers
WHERE ContactTitle='Owner'

--30. 50$ ile 100$ aras�nda bulunan t�m �r�nlerin adlar� ve fiyatlar�n� listeleyiniz.

SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 50 AND 100;

--31. 1 temmuz 1996 ile 31 Aral�k 1996 tarihleri aras�ndaki sipari�lerin (Orders), Sipari�ID (OrderID) ve Sipari�Tarihi (OrderDate) bilgilerini listeleyiniz.

SELECT OrderID,OrderDate 
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-12-31'

--32. 1997 y�l�na ait sat��lar�(Orders) listeleyiniz.

SELECT OrderID
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31'

--33. 1997 Ocak ay�na ait Londra ve Fransaya yap�lan sat��lar� listeleyiniz.

SELECT OrderID
FROM Orders
WHERE ShipCity='London'or ShipCountry='France'or OrderDate BETWEEN '1997-01-01' AND '1997-01-31'

--34. 1955-1963 y�llar� aras�nda do�mu� olan 3 Amerikal� olmayan �al��an� listeleyiniz.(Employee tablosu)

SELECT FirstName, LastName, BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1955-01-01' AND '1963-12-31' AND (Country != 'USA')

--35. 1997 y�l�n�n ilk 6 ay�nda Londra ya yap�lan sat��lar� listeleyiniz.

SELECT OrderID
FROM Orders
WHERE ShipCity='London' OR OrderDate BETWEEN '1997-01-01' AND '1997-06-31'

--36. 1998 y�l�nda g�nderilemeyen sipari�leri g�r�nt�leyiniz.(Orders)

SELECT * FROM Orders 
WHERE ShippedDate is null and YEAR(OrderDate) = 1998

--37. Deniz �r�nlerinden ve stoklarda 15 ten �ok olan �r�nleri g�steriniz.

SELECT ProductName, UnitsInStock 
FROM Products
WHERE UnitsInStock>15 and CategoryID=8

--38. �lkesi (Country) Spain veya France veya Germany olan m��terileri listeleyiniz.

SELECT ContactName,Country
FROM Customers
WHERE Country= 'Spain'or Country = 'France' or Country = 'Germany'

--39. �lkesi (Country) Spain veya France veya Germany olmayan m��terileri listeleyiniz.

SELECT ContactName,Country
FROM Customers
WHERE Country!='Spain' or Country!='France' or Country!='Germany'

--40. Amerika�da ya�amayan �al��anlar� listeleyiniz.

SELECT FirstName,LastName,Country
FROM Employees
WHERE Country != 'USA'

--41. En Pahal� 5 �r�n� listeleyiniz.

SELECT TOP 5 ProductId, ProductName, UnitPrice * UnitsInStock ToplamMaliyet 
FROM Products 
ORDER BY ToplamMaliyet DESC 

--42. 1996 y�l�n�n 12 ay�nda yap�lan sat��lardan nakliye(freight) �cretlerinden en pahal� 3 tanesini g�steriniz

SELECT TOP 3 * 
FROM Orders 
WHERE YEAR(OrderDate) = 1996 and MONTH(OrderDate) = 12
ORDER BY Freight DESC

--43. �r�nlerimi en pahal�dan en ucuza do�ru s�ralas�n, ama stoklar�n� k���kten-b�y��e do�ru g�stersin sonu� olarak �r�n ad� ve fiyat�n� g�stersin

SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
ORDER BY UnitPrice DESC, UnitsInStock ASC

--44. 1 Numaral� kategoride ka� �r�n vard�r.

SELECT COUNT(*) ProductName
FROM Products
WHERE CategoryID=1

--45. Ka� farkl� �lkeye sat�� yap�lmaktad�r. Bunlar� listeleyiniz.

SELECT COUNT(DISTINCT Country)
FROM Customers

--46. T�m ciro miktar� ne kadard�r?

SELECT SUM(UnitPrice*Quantity*(1-Discount)) AS [Toplam Ciro]
FROM [Order Details]

--47. Ortalama �r�n Fiyat� nedir?

SELECT AVG(UnitPrice) [Ortalama �r�n Fiyat�]
FROM Products

--48. En pahal� �r�n�n ad� ve fiyat� nedir?

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice=(SELECT MAX(UnitPrice)
FROM Products)

--49. En ucuz �r�n�n ad� ve fiyat� nedir?

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice=(SELECT MIN(UnitPrice)
FROM Products)

--50. En az kazand�ran sipari�in tutar� nedir?

SELECT TOP 1  OrderID, SUM(UnitPrice*Quantity) AS [En K�rs�z Sipari�]
FROM [Order Details]
GROUP BY OrderID
ORDER BY [En K�rs�z Sipari�] ASC

--51. Hangi �r�n kategorisinde ka� adet �r�n vard�r. �simleriyle ve adetleriyle birlikte belirtiniz.

SELECT CategoryName, ProductName
FROM Categories C INNER JOIN Products P 
ON C.CategoryID=P.CategoryID
ORDER BY CategoryName ASC

--52. 500 adetden fazla sat�lan �r�nler nedir?

SELECT OrderID, SUM(Quantity) AS [Toplam Sipari� Miktar�]
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) >500

--53. Hangi sipari�i hangi m��teri vermi�?

SELECT CompanyName AS Customer, OrderID AS [Order]
FROM Customers C INNER JOIN Orders O
ON C.CustomerID=O.CustomerID
ORDER BY CompanyName

--54. En fazla sipari� alan �al��an�m kimdir?

SELECT TOP 1 FirstName + '  '+ LastName AS Employee, COUNT(OrderID) AS [Order Quantity]
FROM Employees E INNER JOIN Orders O
ON E.EmployeeID=O.EmployeeID
GROUP BY  FirstName, LastName
ORDER BY [Order Quantity] DESC