															--** OXO GAME**--
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--create table Oyun_Tahtasi (
--  row int not null,
--  col int not null,
--  value char(1) not null default ' ',
--  primary key (row, col)
--  )

--insert into  Oyun_Tahtasi (row, col) 
--values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3);

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 -- create trigger Deger_Gir
 --on Oyun_Tahtasi
 --instead of update
 --as
 --begin 
 --declare @row int,@col int,@value char(1)
 --select  @row=row,@col=col,@value=value from inserted
 --select  @row=row,@col=col from  deleted
 ----Pozisyon dolumu bosmu kontrolu
 --begin
 -- if (select value from Oyun_Tahtasi where row = @row AND col = @col) <> ' '
 -- begin
 --   raiserror('**Bu pozisyon zaten dolu baska bir secim yapiniz**', 16, 1)
 --   return;
 -- end
  
 --update Oyun_Tahtasi set value=@value where row=@row AND col=@col
 --print 'Deger Atandi'
 --select * from Oyun_Tahtasi
 --end
 --end

 --drop trigger Deger_Gir
 
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--create trigger Oyun_Tahtasini_Temizle
--on Oyun_Tahtasi
--instead of delete
--as
--begin
--declare @row int,@col int,@value char(1) 
--select @row=row,@col=col,@value=value from deleted
--delete from Oyun_Tahtasi
--begin 
--insert into  Oyun_Tahtasi (row, col) 
--values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3);
--end
--begin
--select * from Oyun_Tahtasi
--end
--end

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--create procedure oyun_durumu
----returns char(1)
--as
--begin
----returns char(1)
-- --kazananý kontrol et

--  declare @winner char(1);
--  select value
--  from Oyun_Tahtasi
--  where row = 1 AND value = (select value FROM Oyun_Tahtasi WHERE row = 2 AND col = col) 
--  AND value = (select value from Oyun_Tahtasi where row = 3 AND col = col)
--  UNION

--    select value
--  from Oyun_Tahtasi
--  where col = 1 AND value = (select value from Oyun_Tahtasi where row = row AND col = 2) 
--AND value = (select value from Oyun_Tahtasi where row = row AND col = 3)
--  UNION

--  select value
--  from Oyun_Tahtasi
--  where row = col AND value = (select value from Oyun_Tahtasi where row = 2 AND col = 2) 
--AND value = (select value from  Oyun_Tahtasi where row = 3 AND col = 3)
--  UNION

--  select value
--  from Oyun_Tahtasi
--  where row = 3 AND col = 1 AND value = (select value from Oyun_Tahtasi where row = 2 AND col = 2) 
--AND value = (select value from Oyun_Tahtasi where row = 1 AND col = 3);

--   --Tüm kolanlar doluysa  oyun beraber bittigi zaman 'T' bas Oyun tahtasýnda hala boþluk varsa '' bas

--  if @winner is not null
--    return @winner;
--  else if (select count(*) from Oyun_Tahtasi where value = ' ') = 0
--    return 'T';
--  else
--    return ' ';
--end

--drop procedure oyun_durumu

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--create function oyun_durumu ()
--returns char(1)
--as
--begin
--   check for a winner 

--  declare @winner char(1);
--  select value
--  from Oyun_Tahtasi
--  where row = 1 AND value = (select value FROM Oyun_Tahtasi WHERE row = 2 AND col = col) 
--  AND value = (select value from Oyun_Tahtasi where row = 3 AND col = col)
--  UNION

--    select value
--  from Oyun_Tahtasi
--  where col = 1 AND value = (select value from Oyun_Tahtasi where row = row AND col = 2) 
--AND value = (select value from Oyun_Tahtasi where row = row AND col = 3)
--  UNION

--  select value
--  from Oyun_Tahtasi
--  where row = col AND value = (select value from Oyun_Tahtasi where row = 2 AND col = 2) 
--AND value = (select value from  Oyun_Tahtasi where row = 3 AND col = 3)
--  UNION

--  select value
--  from Oyun_Tahtasi
--  where row = 3 AND col = 1 AND value = (select value from Oyun_Tahtasi where row = 2 AND col = 2) 
--AND value = (select value from Oyun_Tahtasi where row = 1 AND col = 3);

--   Tüm kolanlar doluysa  oyun beraber bittigi zaman 'T' bas Oyun tahtasýnda hala boþluk varsa '' bas

--  if @winner is not null
--    return @winner;
--  else if (select count(*) from Oyun_Tahtasi where value = ' ') = 0
--    return 'T';
--  else
--    return ' ';
--end

--select Oyun_Durumu ();

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--update Oyun_Tahtasi set value='O' where row=2 AND col=2		--//DEGER GÝR//-- 

--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 --delete from Oyun_Tahtasi                                    --//Oyun Tahtsýný Temizle//--

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 --exec oyun_durumu

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
