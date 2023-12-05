# Discourse Category Jumbotron Component

This Discourse component offers a customizable jumbotron for category pages. Enhance your forum's category pages by displaying detailed banners with various options, including descriptions, logos, and more.

## Features

- **Dynamic Routes**: Customize the jumbotron display on different routes.
- **Category Descriptions**: Option to display category descriptions.
- **Category Logos**: Show category logos in the jumbotron.
- **Nested Category Levels**: Control the display of the jumbotron based on category nesting levels.
- **Category Exceptions**: Exclude specific categories from displaying jumbotrons.
- **Flexible Positioning**: Choose from various positions to display the jumbotron.
- **Category Icons**: Incorporate icons from the Discourse Category Icons component.
- **Visibility of Lock Icon**: Show a lock icon for categories with read restrictions.
- **Layout Customization**: Adjust the flex direction, content justification, and item alignment.
- **Logo Size Options**: Control the size of the category logo within the jumbotron.
- **Color Layout Choices**: Select different color layouts for the jumbotron.

## Preview

**Bordered color layout with logo aligned on the end of the container**

![](https://imgur.com/37rne5n.png)


**Bordered color layout with logo aligned on the start of the container**

![](https://imgur.com/56Potg5.png)

**Fill color layout**

![](https://imgur.com/IldUEZ1.png)

**Fill color layout on a different plugin outlet**

![](https://imgur.com/uDtMw79.png)

**Fill color layout centered without logo**

![](https://imgur.com/GE433k3.png)

**Fill color layout centered with a big logo**

![](https://imgur.com/zmJ7ckz.png)


## Settings

1. **routes**
   - **Default**: `discovery`
   - **Type**: `list`

2. **show_description**
   - **Default**: `true`
   - **Description**: Show description from "About This Category" post.

3. **show_category_logo**
   - **Default**: `true`
   - **Description**: Show category logo.

4. **max_level**
   - **Default**: `3`
   - **Min**: `0`
   - **Max**: `4`
   - **Description**: Maximum category nesting level to show the jumbotron.

5. **hide_if_no_description**
   - **Default**: `true`
   - **Description**: Hide banners if category description is not set.

6. **exceptions**
   - **Default**: ``
   - **Type**: `list`
   - **List Type**: `simple`
   - **Description**: Banner will not show for these category NAMES.

7. **plugin_outlet**
   - **Default**: `above-main-container`
   - **Type**: `enum`
   - **Choices**:
     - `below-site-header`
     - `above-site-header`
     - `above-main-container`
     - `header-list-container-bottom`
   - **Description**: Changes the position of the jumbotron on the page.
   - **Refresh**: `true`

8. **show_category_icon**
   - **Default**: `true`
   - **Description**: Show category icon from the [Discourse Category Icons component](https://meta.discourse.org/t/category-icons/104683).

9. **show_lock_icon**
   - **Default**: `true`
   - **Description**: Show a lock icon for categories with read restrictions.

10. **flex_direction**
    - **Default**: `row`
    - **Type**: `enum`
    - **Choices**:
      - `column`
      - `column-reverse`
      - `row`
      - `row-reverse`
    - **Description**: Changes the direction of the jumbotron items.

11. **justify_content**
    - **Default**: `start`
    - **Type**: `enum`
    - **Choices**:
      - `start`
      - `center`
      - `end`
    - **Description**: Changes the alignment of the jumbotron items on the main Axis.

12. **align_items**
    - **Default**: `center`
    - **Type**: `enum`
    - **Choices**:
      - `start`
      - `center`
      - `end`
    - **Description**: Changes the alignment of the jumbotron items on the Cross Axis.

13. **logo_size**
    - **Default**: `medium`
    - **Type**: `enum`
    - **Choices**:
      - `small`
      - `medium`
      - `large`
      - `original`
    - **Description**: Constraints the width of the logo.

14. **color_layout**
    - **Default**: `border`
    - **Type**: `enum`
    - **Choices**:
      - `none`
      - `border`
      - `fill`
    - **Description**: Defines the color layout of the jumbotron.

## Installation

Follow these steps to add this component to your Discourse forum:

1. Navigate to `Admin` > `Customize` > `Themes`.
2. Click on `Install`.
3. Select `From a git repository`.
4. Input the URL of this repository: `https://github.com/ICIJ/discourse-category-jumbotron`
5. Click on `Install`.

## Contributing

Your contributions are welcome! Please feel free to submit pull requests or issues on the repository to improve the component or fix problems.

## License

This project is licensed under the [MIT License](LICENSE.md).
