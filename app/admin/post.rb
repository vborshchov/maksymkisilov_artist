ActiveAdmin.register Post do

  index do
    selectable_column
    column :title
    column :archive
    column :created_at
    column :updated_at
    actions
  end

  batch_action "В архів" do |ids|
    Post.find(ids).each do |post|
      post.update_attributes(archive: true)
    end
    redirect_to collection_path, alert: "Новина переміщена в архів"
  end

  batch_action "З архіву" do |ids|
    Post.find(ids).each do |post|
      post.update_attributes(archive: false)
    end
    redirect_to collection_path, alert: "Новина переміщена з архіву"
  end

  form do |f|
    f.inputs "Новина" do
      f.input :title, label: "Заголовок"
      # f.input :body, label: "Текст"
      f.input :body, :as => :ckeditor
    end
    f.actions
  end

  permit_params :title, :body, :archive

end
