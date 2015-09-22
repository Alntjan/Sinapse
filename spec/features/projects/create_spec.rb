require 'spec_helper'

describe "Creating projects" do
  it "redirects to project page on success" do
    visit "/projects"
    click_link "Começar Projecto"
    within("#new-project") do
      fill_in 'project_title', :with => 'Titulo Teste'
      fill_in 'project_about', :with => 'About Teste'
    end
    click_button 'Criar Projecto'
    expect(page).to have_content("Titulo Teste")
    expect(page).to have_content("About Teste")
  end

  it "displays an error when the project has no title" do
    expect(Project.count).to eq(0)

    visit "/projects"
    click_link "Começar Projecto"
    within("#new-project") do
      fill_in 'project_title', :with => ''
      fill_in 'project_about', :with => 'About Teste'
    end
    click_button 'Criar Projecto'

    expect(page).to have_content("Erro")
    expect(Project.count).to eq(0)
  end

  it "displays an error when the project has a title with less than 3 letters" do
    expect(Project.count).to eq(0)

    visit "/projects"
    click_link "Começar Projecto"
    within("#new-project") do
      fill_in 'project_title', :with => 'Hi'
      fill_in 'project_about', :with => 'About Teste'
    end
    click_button 'Criar Projecto'

    expect(page).to have_content("Erro")
    expect(Project.count).to eq(0)
  end

  it "redirects to project page on success although the project has no description" do
    expect(Project.count).to eq(0)

    visit "/projects"
    click_link "Começar Projecto"
    within("#new-project") do
      fill_in 'project_title', :with => 'Titulo Teste'
      fill_in 'project_about', :with => ''
    end
    click_button 'Criar Projecto'

    expect(page).to have_content("Titulo Teste")
  end
end
