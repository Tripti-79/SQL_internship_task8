-- function created
create or replace function cal_profit_loss(sp in number,cp in NUMBER)
return NUMBER
is
result1 number;
BEGIN
result1 :=sp-cp;
return result1;
end;

-- function call
DECLARE
ans number;
begin
    ans :=CAL_PROFIT_LOSS(400 , 210);
    if ans>0 THEN
    dbms_output.put_line('Profit occur : '||ans);
    ELSE
    dbms_output.put_line('Loss occur : '||ans);
end if;
end;

-- procedure created
create or replace procedure calculator(num1 in number,num2 in number,sum_result out number,subtract out number,multiply out number)as
BEGIN
    sum_result :=num1+num2;
    subtract :=num1-num2;
    multiply :=num1*num2;
end;

-- procedure call
DECLARE
n1 number :=50;
n2 number :=14;
sum1 number;
multiply number;
subtract number;
BEGIN
CALCULATOR(n1,n2,sum1,subtract,multiply);
dbms_output.PUT_LINE('ADDITION:'||sum1 || '  SUBTRACT:'||subtract || '  MULTIPLY:'||multiply);
end;

-- procedure created
create or replace procedure amount_discount(actual_amt in number,updated_amt out number)as
begin
if actual_amt>=500 THEN
updated_amt :=actual_amt-50;
else
updated_amt :=actual_amt;
end if;
end; 


-- procedure call
declare 
actual_amt number(5,2);
updated_amt number(5,2);
dummy_amt number;
BEGIN
select amount into dummy_amt from payment where passenger_id='PS1' ;
actual_amt :=dummy_amt;
amount_discount(actual_amt,updated_amt);
if actual_amt>=500 THEN
dbms_output.put_line('Rs.50 deducted from amount .' || updated_amt);
update payment set amount=updated_amt where passenger_id='PS1';
else
    dbms_output.put_line('Amount .' || updated_amt);
end if ;
end;
