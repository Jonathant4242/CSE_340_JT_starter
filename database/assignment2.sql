-- 1) Insert
INSERT INTO public.account (account_firstname, account_lastname, account_email, account_password)
VALUES ('Tony','Stark','tony@starkent.com','Iam1ronM@n');

SELECT account_id, account_firstname, account_lastname, account_email, account_type
FROM public.account
WHERE account_email = 'tony@starkent.com';

-- 2) Update to Admin  (ENUM uses 'Admin' with capital A)
UPDATE public.account
SET account_type = 'Admin'
WHERE account_email = 'tony@starkent.com';

SELECT account_email, account_type
FROM public.account
WHERE account_email = 'tony@starkent.com';

-- 3) Delete
DELETE FROM public.account
WHERE account_email = 'tony@starkent.com';

SELECT account_id
FROM public.account
WHERE account_email = 'tony@starkent.com';

-- 4) Replace text in GM Hummer description
SELECT inv_make, inv_model, inv_description
FROM public.inventory
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

UPDATE public.inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior')
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

SELECT inv_make, inv_model, inv_description
FROM public.inventory
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- 5) JOIN for “Sport” items (expect 2 rows)
SELECT i.inv_make, i.inv_model, c.classification_name
FROM public.inventory i
JOIN public.classification c USING (classification_id)
WHERE c.classification_name = 'Sport';

-- 6) Add “/vehicles/” into paths
UPDATE public.inventory
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');

SELECT inv_image, inv_thumbnail
FROM public.inventory
LIMIT 1;