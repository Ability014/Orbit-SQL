# Orbit-SQL
Orbit SQL Learning Community

--Creating a Pivot Table from Bitcoin Dataset haing Year by Month

select cc.year,
	     sum(cc.Jan) Jan,
       sum(cc.Feb) Feb,
       sum(cc.Mar) Mar,
       sum(cc.Apr) Apr,
       sum(cc.May) May,
       sum(cc.Jun) Jun,
       sum(cc.Jul) Jul,
       sum(cc.Aug) Aug,
       sum(cc.Sep) Sep,
       sum(cc.Oct) Oct,
       sum(cc.Nov) Nov,
       sum(cc.Dec) 'Dec'
from (
Select aa.year, 
	     case when aa.year between 2013 and 2020 and aa.mon_year = 'January' then aa.closing_price end as Jan,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'February' then aa.closing_price end as Feb,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'March' then aa.closing_price end as Mar,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'April' then aa.closing_price end as Apr,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'May' then aa.closing_price end as May,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'June' then aa.closing_price end as Jun,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'July' then aa.closing_price end as JUl,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'August' then aa.closing_price end as Aug,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'September' then aa.closing_price end as Sep,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'October' then aa.closing_price end as Oct,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'November' then aa.closing_price end as Nov,
       case when aa.year between 2013 and 2020 and aa.mon_year = 'December' then aa.closing_price end as 'Dec'
from (
select year(Date) 'Year', 
	     monthname(Date) as 'mon_year',
       round(avg(closing_price),2) closing_price
from btc_ts 
group by year, mon_year) aa) cc
group by cc.year;
