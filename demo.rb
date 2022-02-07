require "uri"
require "net/http"
require "json"

# ------------------------------------------- IES -------------------------------------------
uri = URI("http://localhost:3000/ies")
req = Net::HTTP::Post.new(uri, "Content-Type" => "application/json")

# 1
req.body = {
  nome: "Wikipedia",
  cnpj: "12908392213",
  tipo: "Universidade",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# 2
req.body = {
  nome: "WhatsApp",
  cnpj: "9218301923",
  tipo: "Escola",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# 3
req.body = {
  nome: "YouTube",
  cnpj: "12831238120",
  tipo: "Creche",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# ------------------------------------------- ALUNOS -------------------------------------------
uri = URI("http://localhost:3000/alunos")
req = Net::HTTP::Post.new(uri, "Content-Type" => "application/json")

# 1
req.body = {
  nome: "Brunin",
  cpf: "109820319213",
  data_nascimento: "24/10/1987",
  telefone: "219831287391283",
  genero: "M",
  tipo_pagamento: "Boleto",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# 2
req.body = {
  nome: "Brunin Agiota",
  cpf: "9281093812",
  data_nascimento: "01/01/2010",
  telefone: "2191287391283",
  genero: "M",
  tipo_pagamento: "Boleto",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# 3
req.body = {
  nome: "Mini Brunin",
  cpf: "10912321419213",
  data_nascimento: "03/02/2020",
  telefone: "2121309213",
  genero: "M",
  tipo_pagamento: "Cartao",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# ------------------------------------------- Matriculas -------------------------------------------
uri = URI("http://localhost:3000/matriculas")
req = Net::HTTP::Post.new(uri, "Content-Type" => "application/json")

# 1
req.body = {
  valor_total: 145,
  qtd_fatura: 3,
  dia_vencimento: 13,
  nome_curso: "Especialista em coach quantico",
  ie: "Wikipedia",
  aluno: "Brunin",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# 2
req.body = {
  valor_total: 300,
  qtd_fatura: 2,
  dia_vencimento: 1,
  nome_curso: "Micro economia para bancos ilegais",
  ie: "WhatsApp",
  aluno: "Brunin Agiota",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body

# 3
req.body = {
  valor_total: 15,
  qtd_fatura: 1,
  dia_vencimento: 31,
  nome_curso: "Intensivao de mamadera",
  ie: "YouTube",
  aluno: "Mini Brunin",
}.to_json
res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end
puts res.body
