# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="conitainer">
          <a class="navbar-brand" href="/">
            <span>LOGO</span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navberNavDropdown"
          aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ml-auto">

              <% if customer_signed_in? %>

              <li class="nav-item">
                <!--<= link_to "About" %>-->
              </li>

              <li class="nav-item">
                <%= link_to "商品一覧", admin_items_path, class:"btn btn-outline-success" %>
              </li>

              <li class="nav-item">
                <%= link_to "新規登録", new_customer_registration, class:"btn btn-outline-success" %>
              </li>

              <li class="nav-item">
                <% link_to "ログイン", new_customer_session_path, class:"btn btn-outline-success" %>
              </li>

            <% else %>

            <% end %>

            </ul>


          </div>


        </div>
      </nav>
      
       <footer class="bg-dark text-white pt-5 pb-4">
    <div class="container"></div>
      <div class="row no-gutters"></div>
        <div class="col-md-4"></div>
  </footer>
  
  t.references :genre, foreign_key: true
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_activ, default: true