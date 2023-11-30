import Component from "@glimmer/component";
import { getOwner } from "@ember/application";
import { computed } from "@ember/object";
import { inject as service } from "@ember/service";
import { htmlSafe } from "@ember/template";
import isPresent from "../helpers/is-present";

export default class CategoryJumbotron extends Component {
  @service router;
  @service siteSettings;
  @service currentCategory;

  @computed("router.currentRoute.name")
  get category() {
    return this.currentCategory.category;
  }

  @computed("currentRoutesNames")
  get currentRoutesMatch() {
    return this.currentRoutesNames.some((name) =>
      settings.routes.includes(name)
    );
  }

  @computed("router.currentRoute.name")
  get currentRoutesNames() {
    return this.routeNames(this.router.currentRoute);
  }

  get displayCategoryDescription() {
    return settings.show_description && isPresent(this.category?.description);
  }

  get displayLockIcon() {
    return settings.show_lock_icon && this.category.read_restricted;
  }

  get displayCategoryIcon() {
    return settings.show_category_icon && this.hasIconComponent;
  }

  @computed("category", "currentRoutesMatch")
  get displayJumbotron() {
    return (
      this.currentRoutesMatch &&
      this.category &&
      this.category.level <= settings.max_level
    );
  }

  get hasIconComponent() {
    return getOwner(this).hasRegistration("component:category-icon");
  }

  get safeStyle() {
    return htmlSafe(`
      --category-color: #${this.category.color};
      --category-text-color: #${this.category.text_color};
    `);
  }

  get safeClass() {
    return htmlSafe(`
      category-jumbotron-${this.category.slug}
      category-jumbotron--flex-${settings.flex_direction}
      category-jumbotron--align-items-${settings.align_items}
      category-jumbotron--justify-content-${settings.justify_content}
      category-jumbotron--logo-${settings.logo_size}
      category-jumbotron--color-layout-${settings.color_layout}
    `);
  }

  routeNames(route) {
    if (route) {
      return [...this.routeNames(route.parent), route.name];
    }
    return [];
  }
}
