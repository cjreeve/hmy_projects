require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/projects", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Project.create! valid_attributes
      get projects_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      project = Project.create! valid_attributes
      get project_url(project)
      expect(response).to be_successful
    end
  end

  describe "GET /show with markdown description" do
    it "renders markdown as HTML" do
      project = Project.create!(title: "Markdown Test", manager_name: "Manager", description: "# Heading\n\n**bold** and _italic_ text.")
      get project_url(project)
      expect(response.body).to include("<h1>Heading</h1>")
      expect(response.body).to include("<strong>bold</strong>")
      expect(response.body).to include("<em>italic</em>")
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_project_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      project = Project.create! valid_attributes
      get edit_project_url(project)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Project" do
        expect {
          post projects_url, params: { project: valid_attributes }
        }.to change(Project, :count).by(1)
      end

      it "redirects to the created project" do
        post projects_url, params: { project: valid_attributes }
        expect(response).to redirect_to(project_url(Project.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Project" do
        expect {
          post projects_url, params: { project: invalid_attributes }
        }.to change(Project, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post projects_url, params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "POST /create with invalid parameters" do
    it "renders the new template with errors" do
      post projects_url, params: { project: { title: "", manager_name: "" } }
      expect(response.body).to include("There were errors with your submission")
      expect(response.body).to include("Title can&#39;t be blank")
      expect(response.body).to include("Manager name can&#39;t be blank")
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested project" do
        project = Project.create! valid_attributes
        patch project_url(project), params: { project: new_attributes }
        project.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        patch project_url(project), params: { project: new_attributes }
        project.reload
        expect(response).to redirect_to(project_url(project))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        project = Project.create! valid_attributes
        patch project_url(project), params: { project: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete project_url(project)
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete project_url(project)
      expect(response).to redirect_to(projects_url)
    end
  end
end
