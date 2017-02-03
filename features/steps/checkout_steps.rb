Dado(/^que eu esteja no catálogo da loja de livros$/) do
  visit 'http://bookstore.com/catalog'
end

Quando(/^eu compro um livro$/) do
  click_button 'Add to cart'
  click_button 'Go to checkout'
end

Quando(/^eu finalizo o pedido com:$/) do |table|
  data = table.hashes.first
  fill_in 'order_name', with: data['name']
  fill_in 'order_address', with: data['address']
  fill_in 'order_email', with: data['email']
  fill_in 'order_payment', with: data['payment']
  click_button 'Place Order'
end

Quando(/^eu finalizo o pedido deixando o campo "([^"]*)" em branco$/) do |blank_field|
  name = blank_field == 'Name' ? '' : 'John Doe'
  address = blank_field == 'Address' ? '' : '1500 Old Street, New York, NY'
  email = blank_field == 'Email' ? '' : 'johndoe@mail.com'
  
  fill_in 'order_name', with: name
  fill_in 'order_address', with: address
  fill_in 'order_email', with: email
  fill_in 'order_payment', with: 'Boleto'
  
  click_button 'Place Order'
end

Então(/^eu devo ver a mensagem de erro "([^"]*)"$/) do |error_message|
  expect(page).to have_content error_message
end

Então(/^nas formas de pagamento disponíveis deve conter "([^"]*)"$/) do |payment_method|
  expect()
end

Então(/^eu devo ver a mensagem "([^"]*)"$/) do |message|
  expect(page).to have_content message
end
