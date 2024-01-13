select cnd.Country, cr.Region1, cr.Region2, cr.Continent, mc.MainContent
from country_national_dish cnd
inner join country_region cr
on cnd.Country_ID = cr.Country_ID
inner join main_contents mc
on cnd.Dishes_ID = mc.Dishes_ID;
