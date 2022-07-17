CREATE TABLE "comments" (
  "comment_id" int4 NOT NULL,
  "prodect_ref_id" int4,
  "user_ref_id" int4,
  "title" varchar(255),
  "description" varchar(255),
  "created_at" date,
  "deleted_at" date,
  "updated_at" date,
  PRIMARY KEY ("comment_id")
);

CREATE TABLE "addresses" (
  "address_id" int4 NOT NULL,
  "user_id" int4,
  "content" varchar(255),
  "location_ref_id" int4,
  PRIMARY KEY ("address_id")
);

CREATE TABLE "cart_items" (
  "cart_item_id" int4 NOT NULL,
  "product_ref_id" int4 NOT NULL,
  "quantity" int2,
  "price" int2,
  "tax" int2,
  "discount_ref_id" int4,
  "created_at" date,
  "deleted_at" date,
  "updated_at" date,
  "cart_ref_id" int4,
  PRIMARY KEY ("cart_item_id")
);

CREATE TABLE "carts" (
  "cart_id" int4 NOT NULL,
  "user_ref_id" int4 NOT NULL,
  "created_at" date NOT NULL,
  "updated_at" date,
  "deleted_at" date,
  "code" int4,
  "status" varchar(20),
  PRIMARY KEY ("cart_id")
);

CREATE TABLE "categories" (
  "category_id" int4 NOT NULL,
  "title" varchar(255) NOT NULL,
  "description" varchar(255),
  "created_at" date,
  "deleted_at" date,
  "updated_at" date,
  PRIMARY KEY ("category_id")
);

CREATE TABLE "category_meta" (
  "category_meta_id" int4 NOT NULL,
  "category_ref_if" int4,
  "key" varchar(255),
  "value" varchar(255),
  PRIMARY KEY ("category_meta_id")
);

CREATE TABLE "discount" (
  "discount_id" int4 NOT NULL,
  "title" varchar(255),
  "description" varchar(255),
  "expire" date,
  "created_at" date,
  "updated_at" date,
  "deleted_at" date,
  "discount" varchar(255),
  PRIMARY KEY ("discount_id")
);

CREATE TABLE "location" (
  "location_id" int4 NOT NULL,
  "name" varchar(255),
  "parent_location_id" int4,
  PRIMARY KEY ("location_id")
);

CREATE TABLE "order_items" (
  "order_item_id" int4 NOT NULL,
  "order_ref_id" int4 NOT NULL,
  "product_ref_id" int4 NOT NULL,
  PRIMARY KEY ("order_item_id")
);

CREATE TABLE "orders" (
  "order_id" int4 NOT NULL,
  "user_ref_id" int4 NOT NULL,
  "name" varchar(255),
  "familly" varchar(255),
  "phone" int2,
  "address" varchar(255),
  "status" varchar(255),
  "discount" int2,
  PRIMARY KEY ("order_id")
);

CREATE TABLE "product_meta" (
  "product_meta_id" int4 NOT NULL,
  "product_ref_id" int4,
  "key" varchar(255),
  "value" varchar(255),
  PRIMARY KEY ("product_meta_id")
);

CREATE TABLE "products" (
  "product_id" int4 NOT NULL,
  "name" varchar(255) NOT NULL,
  "category_id" int4 NOT NULL,
  "price" int4,
  "quantity" int4,
  PRIMARY KEY ("product_id")
);

CREATE TABLE "stores" (
  "store_id" int4 NOT NULL,
  PRIMARY KEY ("store_id")
);

CREATE TABLE "table_1" (

);

CREATE TABLE "user_meta" (
  "user_meta_id" int4 NOT NULL,
  "user_ref_id" int4,
  "key" varchar(255),
  "value" varchar(255),
  PRIMARY KEY ("user_meta_id")
);

CREATE TABLE "users" (
  "user_id" int4 NOT NULL,
  "name" varchar(80),
  "family" varchar(100),
  "email" varchar(60),
  "phone" varchar(15),
  "creates_at" time,
  "updated_at" date,
  "deleted_at" date,
  "address_ref_id" int4,
  PRIMARY KEY ("user_id")
);

ALTER TABLE "comments" ADD CONSTRAINT "prodect_ref_id" FOREIGN KEY ("prodect_ref_id") REFERENCES "products" ("product_id") ON DELETE RESTRICT;
ALTER TABLE "comments" ADD CONSTRAINT "user_ref_id" FOREIGN KEY ("user_ref_id") REFERENCES "users" ("user_id") ON DELETE RESTRICT;
ALTER TABLE "addresses" ADD CONSTRAINT "location_ref_id" FOREIGN KEY ("location_ref_id") REFERENCES "location" ("location_id") ON DELETE RESTRICT;
ALTER TABLE "cart_items" ADD CONSTRAINT "product_ref_id" FOREIGN KEY ("product_ref_id") REFERENCES "products" ("product_id") ON DELETE RESTRICT;
ALTER TABLE "cart_items" ADD CONSTRAINT "cart_ref_id" FOREIGN KEY ("cart_ref_id") REFERENCES "carts" ("cart_id") ON DELETE CASCADE;
ALTER TABLE "cart_items" ADD CONSTRAINT "discount_ref_id" FOREIGN KEY ("discount_ref_id") REFERENCES "discount" ("discount_id") ON DELETE RESTRICT;
ALTER TABLE "carts" ADD CONSTRAINT "user_ref_id" FOREIGN KEY ("user_ref_id") REFERENCES "users" ("user_id") ON DELETE RESTRICT;
ALTER TABLE "category_meta" ADD CONSTRAINT "category_ref_if" FOREIGN KEY ("category_ref_if") REFERENCES "categories" ("category_id") ON DELETE RESTRICT;
ALTER TABLE "order_items" ADD CONSTRAINT "order_ref_id" FOREIGN KEY ("order_ref_id") REFERENCES "orders" ("order_id") ON DELETE RESTRICT;
ALTER TABLE "order_items" ADD CONSTRAINT "product_ref_id" FOREIGN KEY ("product_ref_id") REFERENCES "products" ("product_id") ON DELETE RESTRICT;
ALTER TABLE "orders" ADD CONSTRAINT "user_ref_id" FOREIGN KEY ("user_ref_id") REFERENCES "users" ("user_id") ON DELETE RESTRICT;
ALTER TABLE "product_meta" ADD CONSTRAINT "product_ref_id" FOREIGN KEY ("product_ref_id") REFERENCES "products" ("product_id") ON DELETE RESTRICT;
ALTER TABLE "products" ADD CONSTRAINT "category_id" FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id") ON DELETE RESTRICT;
ALTER TABLE "user_meta" ADD FOREIGN KEY ("user_ref_id") REFERENCES "users" ("user_id") ON DELETE NO ACTION;
ALTER TABLE "users" ADD CONSTRAINT "address_ref_id" FOREIGN KEY ("address_ref_id") REFERENCES "addresses" ("address_id") ON DELETE RESTRICT;

