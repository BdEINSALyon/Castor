RailsAdmin.config do |config|

  ### Popular gems integration

  config.main_app_name = ["Castor", "BackOffice"]

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    import
    ## With an audit adapter, you can add:
    # history_index
    # history_show

    member :send_email do
      only ['Voter']
      i18n_key :send_email
      controller do
        Proc.new do
          @object.send_link
          redirect_to :index
        end
      end
      link_icon 'icon-envelope'
    end
  end
end
