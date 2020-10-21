 # DB 設計

## users table

| Column           | Type    | Options      |
|------------------|---------|--------------|
| nickname         | string  | null: false  |
| email            | string  | null: false  |
| password         | string  | null: false  |
| last_name        | string  | null: false  |
| first_name       | string  | null: false  |
| last_name_kana   | string  | null: false  |
| first_name_kana  | string  | null: false  |
| birth_year       | date    | null: false  |
| birth_month      | date    | null: false  |
| birth_day        | date    | null: false  |

### Association

* has_many :items
* has_many :buy_histories


## items table

| Column         | Type        | Options            |
|----------------|-------------|--------------------|
| title          | string      | null: false        |
| text           | text        | null: false        |
| category_id    | integer     | null: false        |
| status_id      | integer     | null: false        |
| delivery_id    | integer     | null: false        |
| area_id        | integer     | null: false        |
| day_id         | integer     | null: false        |
| price          | integer     | null: false        |
| user           | references  | foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy_history

## buy_histories table

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| post_num       | string      | null: false       |
| area_id        | integer     | null: false       |
| city_name      | string      | null: false       |
| city_num       | string      | null: false       |
| building_name  | string      |                   |
| phone_num      | string      | null: false       |
| buy_history    | references  | foreign_key: true |

### Association

- has_one :buy_history