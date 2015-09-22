require 'spec_helper'

describe "Creating projects" do
  def create_project(options={})
    options[:title] ||= "Titulo Teste"
    options[:about] ||= "About Teste"

    visit "/projects"
    click_link "Começar Projecto"
    within("#new-project") do
      fill_in 'project_title', :with => options[:title]
      fill_in 'project_about', :with => options[:about]
    end
    click_button 'Criar Projecto'

  end
  it "redirects to project page on success" do
    create_project
    expect(page).to have_content("Titulo Teste")
    expect(page).to have_content("About Teste")
  end

  it "displays an error when the project has no title" do
    expect(Project.count).to eq(0)

    create_project title: ""

    expect(page).to have_content("Erro")
    expect(Project.count).to eq(0)
  end

  it "displays an error when the project has a title with less than 3 letters" do
    expect(Project.count).to eq(0)

    create_project title: "Hi"

    expect(page).to have_content("Erro")
    expect(Project.count).to eq(0)
  end

  it "redirects to project page on success although the project has no description" do
    expect(Project.count).to eq(0)

    create_project description: ""

    expect(page).to have_content("Titulo Teste")
  end
end
