CREATE TABLE divvytrip(
ride_id nvarchar(255),
rideable_type nvarchar(255),
started_at datetime,
time_started_at datetime,
ended_at datetime,
time_ended_at datetime,
ride_length_diff float,
day_time nvarchar(255),
day_of_week_started nvarchar(255),
day_of_week_ended nvarchar(255),
start_station_name nvarchar(255),
end_station_name nvarchar(255),
member_casual nvarchar(255)
)
INSERT INTO divvytrip
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM December
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,day_of_the_week_ended,start_station_name,end_station_name,member_casual
FROM January
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM February
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM March
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM April
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM May
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM June
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM July
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM August
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM September
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM October
UNION ALL
SELECT ride_id,rideable_type,started_at,time_started_at,ended_at,time_ended_at,ride_length_diff,day_time,day_of_week_started,
day_of_week_ended,start_station_name,end_station_name,member_casual
FROM November

SELECT *
FROM divvytrip

ALTER TABLE divvytrip
ALTER COLUMN started_at date

ALTER TABLE divvytrip
ALTER COLUMN time_started_at time

ALTER TABLE divvytrip
ALTER COLUMN ended_at date

ALTER TABLE divvytrip
ALTER COLUMN time_ended_at time

---1) Total Rides

SELECT *
FROM divvytrip

---2) Average Ride length

SELECT AVG(ride_length_diff) AS AvgRideLength
 FROM divvytrip

 DECLARE @t decimal(10,2)=17.02;
 SELECT CONVERT(CHAR(8),
 DATEADD(second, @t%1 * 60,
 DATEADD(minute, @t, 0)), 114); 

----3) Total Rides by User
SELECT member_casual,COUNT(member_casual) AS Total_Users
FROM divvytrip
GROUP BY member_casual
ORDER BY Total_Users DESC

----4) What is the difference in average ride length between member and casual riders?

SELECT AVG(ride_length_diff) AS AvgRideLength
 FROM divvytrip
 WHERE member_casual='casual'

 DECLARE @t decimal(10,2)=23.81;
 SELECT CONVERT(CHAR(8),
 DATEADD(second, @t%1 * 60,
 DATEADD(minute, @t, 0)), 114); 

 SELECT AVG(ride_length_diff)
 FROM divvytrip
 WHERE member_casual='member'

 DECLARE @t decimal(10,2)=12.47;
 SELECT CONVERT(CHAR(8),
 DATEADD(second, @t%1 * 60,
 DATEADD(minute, @t, 0)), 114);

 ----5)What start station do both members frequent the most

  SELECT member_casual,start_station_name,COUNT(start_station_name) AS most_frequent_start_station
 FROM divvytrip
 WHERE member_casual = 'casual'
 GROUP BY member_casual,start_station_name
 ORDER BY most_frequent_start_station DESC


 SELECT member_casual,start_station_name,COUNT(start_station_name) AS most_frequent_start_station
 FROM divvytrip
 WHERE member_casual = 'member'
 GROUP BY member_casual,start_station_name
 ORDER BY most_frequent_start_station DESC

 ---6)What time of the day do both members ride the most?

SELECT member_casual,day_time,COUNT(day_time) AS Number_of_rides
FROM divvytrip
GROUP BY member_casual,day_time
ORDER BY member_casual

---7) what day of the week does casual and annual members ride?

SELECT member_casual,day_of_week_started,COUNT(day_of_week_started) AS Busiest_week_by_riders
FROM divvytrip
GROUP BY member_casual,day_of_week_started
ORDER BY Busiest_week_by_riders DESC
