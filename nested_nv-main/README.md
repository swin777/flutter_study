# Nested Navigation 

## Why Nested Navigation
- This delegation of navigation facilitates greater local control, which is generally preferable when developing software.
- You can avoid name collisions by using nested navigators in large projects.
  - Top-level route: /, /signup, /settings
  - /signup
    - signup/personal_info
    - signup/choose_credentials
  - /settings
    - settings/basic_settings
    - settings/adv_settings
    - setting/super_adv_settings
- In tab navigations, each tab maintains its own navigation history
  - Something like always showing tab navigations...


