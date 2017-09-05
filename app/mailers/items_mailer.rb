class ItemsMailer < ApplicationMailer
  default from: 'info@mystrore.com',
          template_path: 'mailers/items'

  def item_destroyed(item)
    @item = item
    mail to: 'ivanternovyi@gmail.com',
          subject: "Item destroyed"
  end
end
