def m(string)
  puts "=> #{string}"
end

loan_amount = 0
apr = 0
loan_duration_yr = 0
loan_duration_mo = 0
loan_duration = 0

m "Hi! Welcome to Loan Calculator. Let's get started: What is the size of your loan in dollars? (Example: '5000' is a $5000 loan)"
loop do
  loan_amount = gets.chomp
  break if (loan_amount.to_i > 99 && loan_amount.to_i < 10000001) && (loan_amount == loan_amount.to_i.to_s)
  puts "Please put an amount between 100 dollars and 10,000,000 dollars. Do not include any characters other than the digits 0-9. Do not input cents, for example input 3456 instead of 3455.93."
  next
end

m "What is the loan's annual percentage rate? (Example: '6.75' is a 6.75% APR)"
loop do
  apr = gets.chomp
  break if (apr.to_f >= 0.00 && apr.to_f < 99.99) && (apr == apr.to_f.to_s)
  puts "Please put an amount between 0 percent and 100 percent. Do not include any characters other than the digits 0-9 and the period '.' character. Do not input a final zero, for example input 8.4 instead of 8.40."
  next
end

m "How long will this loan last? Put in terms of years and months. (Example: (Years:) 5 (Months:) 6 is a loan duration of 5 years and 6 months."
loop do
  m "Years:"
  loan_duration_yr = gets.chomp
  m "Months:"
  loan_duration_mo = gets.chomp
  break if (loan_duration_yr.to_i >= 0 && loan_duration_yr.to_i < 100) && (loan_duration_mo.to_i >= 0 && loan_duration_mo.to_i <= 12) && (loan_duration_yr == loan_duration_yr.to_i.to_s && loan_duration_mo == loan_duration_mo.to_i.to_s)
  puts "Please put a duration between 0 years and 100 years. Do not include any characters other than the digits 0-9 (do not use decimals). Please try again:"
  next
end
loan_duration = (loan_duration_yr.to_i * 12) + loan_duration_mo.to_i

monthly_apr = (apr.to_f / 12)
loan_amount = loan_amount.to_i
monthly_payment = loan_amount.to_i * (monthly_apr / (1 - (1 + monthly_apr)**(-loan_duration)))
monthly_payment = monthly_payment.truncate(2)

m "Your monthly payment will be #{monthly_payment} dollars. You will have #{loan_duration} payments. You will pay a total of #{monthly_payment * loan_duration} dollars. Then your loan will be totally paid off!"
m "Thanks for using our loan calculator!"