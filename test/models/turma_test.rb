require "test_helper"

class TurmaTest < ActiveSupport::TestCase
  test 'Criando Turma corretamente' do
   turma = Turma.new letra: 'A', anoLetivo: '2021', ano: '7'
   assert turma.save
  end

  test 'Varias letras para tag' do
    turma = Turma.new letra: 'AB', anoLetivo: '2021', ano: '7'
    assert_not turma.save
  end

  test 'Ano letivo menor que o especificado' do
    turma = Turma.new letra: 'B', anoLetivo: '1990', ano: '7'
    assert_not turma.save
  end

  test 'Ano ou serie fora do limite 1ª-9ª' do
    turma = Turma.new letra: 'A', anoLetivo: '2021', ano: '11'
    assert_not turma.save
  end
end
