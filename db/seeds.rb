# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Users
user1 = User.create([login: 'joaoalves', password: '123456', password_confirmation: '123456'])
user2 = User.create([login: 'eduardo', password: '123456', password_confirmation: '123456'])

# Turmas
turma1 = Turma.create([letra: 'A', anoLetivo: '2020', ano: '7'])
turma2 = Turma.create([letra: 'B', anoLetivo: '2020', ano: '7'])
turma3 = Turma.create([letra: 'C', anoLetivo: '2020', ano: '7'])

# Disciplinas
disciplina1 = Disciplina.new([nome: 'Inglês', anoLetivo: '2020', turma_id: turma1.id, user_id: user1.id])

# Alunos
aluno1 = Aluno.create nome: "João Bernardo", turma_id: turma1.first.id