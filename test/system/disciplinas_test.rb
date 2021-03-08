require "application_system_test_case"

class DisciplinasTest < ApplicationSystemTestCase
  setup do
    @disciplina = disciplinas(:one)
  end

  test "visiting the index" do
    visit disciplinas_url
    assert_selector "h1", text: "Disciplinas"
  end

  test "creating a Disciplina" do
    visit disciplinas_url
    click_on "New Disciplina"

    fill_in "Anoletivo", with: @disciplina.anoLetivo
    fill_in "Nome", with: @disciplina.nome
    fill_in "Turma", with: @disciplina.turma_id
    fill_in "User", with: @disciplina.user_id
    click_on "Create Disciplina"

    assert_text "Disciplina was successfully created"
    click_on "Back"
  end

  test "updating a Disciplina" do
    visit disciplinas_url
    click_on "Edit", match: :first

    fill_in "Anoletivo", with: @disciplina.anoLetivo
    fill_in "Nome", with: @disciplina.nome
    fill_in "Turma", with: @disciplina.turma_id
    fill_in "User", with: @disciplina.user_id
    click_on "Update Disciplina"

    assert_text "Disciplina was successfully updated"
    click_on "Back"
  end

  test "destroying a Disciplina" do
    visit disciplinas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Disciplina was successfully destroyed"
  end
end
