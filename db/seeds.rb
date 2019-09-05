# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
User.create!( name: "ゲスト",
              email: "guest@email.com",
              password: "password",
              password_confirmation: "password",)