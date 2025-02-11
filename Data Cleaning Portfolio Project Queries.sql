select*
from PortfolioProject..NashvilleHousing

--Standarize date formate

select SaleDateCoverted, Convert(Date,saledate)
from PortfolioProject..NashvilleHousing

Update NashvilleHousing
set SaleDate=Convert(Date,saledate)

alter Table NashvilleHousing
Add SaleDateCoverted date;

Update NashvilleHousing
Set SaleDateCoverted = Convert(Date,saledate)


  
--Proparty address data

select *
from PortfolioProject..NashvilleHousing
--Where PropertyAddress is null
Order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID,b.PropertyAddress, isnull( a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
  on a.ParcelID=b.ParcelID
  and a.[UniqueID ]<>b.[UniqueID ]
  where a.PropertyAddress is null


Update a
Set PropertyAddress=isnull( a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
  on a.ParcelID=b.ParcelID
  and a.[UniqueID ]<>b.[UniqueID ]
  where a.PropertyAddress is null




  
--Breaking out address in individual collums( Address, city, State)
select PropertyAddress
from PortfolioProject..NashvilleHousing
----Where PropertyAddress is null
--Order by ParcelID

Select 
SUBSTRING( PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address
,SUBSTRING( PropertyAddress, CHARINDEX(',', PropertyAddress)+1,len(PropertyAddress)) as Address
from PortfolioProject..NashvilleHousing

