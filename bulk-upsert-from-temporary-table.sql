create temporary table temp (symbol varchar(255), open decimal, high decimal, low decimal, close decimal, volume varchar(255), date date );

create table if not exists stocks (id serial primary key, symbol varchar(255), open decimal, high decimal, low decimal, close decimal, volume varchar(255), date date, created_at timestamp, updated_at timestamp);

copy temp (symbol, date, open, high, low, close, volume) from '/path/to/file.csv' with delimiter ',' csv header;

delete from stocks using temp where stocks.date = temp.date and stocks.symbol = temp.symbol;

insert into stocks (symbol, open, high, low, close, volume, date) select symbol, open, high, low, close, volume, date from temp;

drop table temp;
