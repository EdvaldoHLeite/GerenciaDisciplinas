require "application_system_test_case"

class TurmasTest < ApplicationSystemTestCase
  setup do
    @turma = turmas(:one)
  end

  test "visiting the index" do
    visit turmas_url
    assert_selector "h1", text: "Turmas"
  end

  test "creating a Turma" do
    visit turmas_url
    click_on "New Turma"

    fill_in "Ano", with: @turma.ano
    fill_in "Anoletivo", with: @turma.anoLetivo
    fill_in "Letra", with: @turma.letra
    click_on "Create Turma"

    assert_text "Turma was successfully created"
    click_on "Back"
  end

  test "updating a Turma" do
    visit turmas_url
    click_on "Edit", match: :first

    fill_in "Ano", with: @turma.ano
    fill_in "Anoletivo", with: @turma.anoLetivo
    fill_in "Letra", with: @turma.letra
    click_on "Update Turma"

    assert_text "Turma was successfully updated"
    click_on "Back"
  end

  test "destroying a Turma" do
    visit turmas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Turma was successfully destroyed"
  end
end
