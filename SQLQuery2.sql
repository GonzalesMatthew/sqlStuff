---------- Subqueries---------

-- nesting one or more queires inside another one
-- two main categories:
-- subquery
-- correlated subquery

-- SUBQUERY
-- artists and their longest track
select *
From Artist a 
 left outer join (select ArtistId, max(t.Milliseconds) LongestSongLength
		from track t
			join album a
				on a.AlbumId = t.AlbumId
		group by ArtistId) maxSong
	on a.ArtistId = maxSong.ArtistId

-- CORRELATED SUBQUERY IN THE SELECT STATEMENT
-- following yield exact same results as above LEFT OUTER JOIN example
select a.ArtistId,
		a.name,
		(select max(Milliseconds) LongestSongLength
			from track t
				join Album al
					on al.AlbumId = t.AlbumId
			where al.ArtistId = a.ArtistId -- the WHERE ties the correlated subquery to the outside SELECT query -- also this execution plan is slightly faster -- runs once per row
			group by ArtistId)
from Artist a

-- CORRELATED SUBQUERY IN THE WHERE CLAUSE
-- which artists have no tracks
select * 
from Artist a 
where not exists(
	select 'poop' -- doesn't matter what you put here, it's not the point
	from track t
		join Album al
			on al.AlbumId = t.AlbumId
	where al.ArtistId = a.ArtistId -- WHERE connects to the outside query
)

-- vs. regular subquery doing the exact same thing
select * 
from Artist a 
where ArtistId not in(
	select ArtistId
	from track t
		join Album al
			on al.AlbumId = t.AlbumId
)