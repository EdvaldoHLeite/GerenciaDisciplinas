require "application_system_test_case"

class AvaliacaosTest < ApplicationSystemTestCase
  setup do
    @avaliacao = avaliacaos(:one)
  end

  test "visiting the index" do
    visit avaliacaos_url
    assert_selector "h1", text: "Avaliacaos"
  end

  test "creating a Avaliacao" do
    visit avaliacaos_url
    click_on "New Avaliacao"

    fill_in "Aluno", with: @avaliacao.aluno_id
    fill_in "Atividade", with: @avaliacao.atividade_id
    fill_in "Observacoes", with: @avaliacao.observacoes
    fill_in "Pontos", with: @avaliacao.pontos
    click_on "Create Avaliacao"

    assert_text "Avaliacao was successfully created"
    click_on "Back"
  end

  test "updating a Avaliacao" do
    visit avaliacaos_url
    click_on "Edit", match: :first

    fill_in "Aluno", with: @avaliacao.aluno_id
    fill_in "Atividade", with: @avaliacao.atividade_id
    fill_in "Observacoes", with: @avaliacao.observacoes
    fill_in "Pontos", with: @avaliacao.pontos
    click_on "Update Avaliacao"

    assert_text "Avaliacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Avaliacao" do
    visit avaliacaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avaliacao was successfully destroyed"
  end
end
