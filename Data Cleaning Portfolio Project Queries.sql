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
