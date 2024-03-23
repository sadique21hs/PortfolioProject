--Select All
select*
from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4



--select those raw

Select location,date,total_cases,new_cases,total_deaths,population
From PortfolioProject..CovidDeaths
where continent is not null
Order by 1,2

--Looking for total cases vs total deaths

Select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where location like '%states%'
and continent is not null
Order by 1,2

--Looking for total case vs population
Select location,date,population,total_cases, (total_cases/population)*100 as PopulationPercentage
From PortfolioProject..CovidDeaths
where location like '%states%'
and continent is not null
Order by 1,2

--Looking country with hiest infacted rate
SELECT  location, MAX(total_cases) as MaxCases 
FROM PortfolioProject..CovidDeaths
where continent is not null
GROUP BY location
ORDER BY MaxCases desc

--Looking countyrs hiest death count
SELECT location, MAX(CAST(total_deaths AS INT)) AS DeathCount 
FROM PortfolioProject..CovidDeaths 
where continent is not null
GROUP BY location 
ORDER BY DeathCount DESC;


--break down to countriens
SELECT continent, MAX(CAST(total_deaths AS INT)) AS DeathCount 
FROM PortfolioProject..CovidDeaths 
where continent is not null
GROUP BY continent
ORDER BY DeathCount DESC;

--Global Number
SELECT date, Sum(new_cases) as SumOfCases , Sum(cast(New_deaths as int))SumOfDeath, Sum(cast(New_deaths as int))/Sum(new_cases)*100 as DeathPercentage 
FROM PortfolioProject..CovidDeaths 
where continent is not null
GROUP BY date
ORDER BY 1,2

--Looking at Total population vs Vaccination

select dea.continent,dea.location, dea.date, dea.population, vac.new_vaccinations
from PortfolioProject..CovidDeaths    dea   --dea is the class of CovidDeath
join PortfolioProject..CovidVaccinations     vac --vac is the class of CovidVaccination
   On dea.location=vac.location
   and dea.date=vac.date
where dea.continent is not null
ORDER BY 2,3

--------------------------------------------------------------------
