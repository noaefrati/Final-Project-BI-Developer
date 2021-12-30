use PriorityERP

insert into CUSTOMERS (CUSTNAME, ADDRESS, STATE, PHONE, AGENT, COUNTRY) values ('Rinaldo Shedd', '68 Grayhawk Plaza', 'North Carolina', '704-385-1299', 36, 1);
insert into AGENTS (AGENTNAME, COMMISSION, ADDRESS, STATE, COUNTRY, EMAIL, PHONE, BRANCH) values ('Jenny Itzhak', 18, '12 Park Meadow Alley', 'South Carolina', 1, 'jennyitzhak@gmail.com', '050-224-9523', 10);
insert into INVOICES (IVDATE, CUST, AGENT, DISCOUNT) values ('20211209', 821, 376, 100);
insert into INVOICEITEMS (IV, PART, PRICE, QUANT, KLINE) values (1001, 70, 82, 1,1001);