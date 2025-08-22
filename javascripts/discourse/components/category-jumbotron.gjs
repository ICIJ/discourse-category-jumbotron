import Component from "@glimmer/component";
import { getOwner } from "@ember/application";
import { computed } from "@ember/object";
import { service } from "@ember/service";
import { htmlSafe } from "@ember/template";
import CdnImg from "discourse/components/cdn-img";
import LightDarkImg from "discourse/components/light-dark-img";
import icon from "discourse/helpers/d-icon";
import isPresent from "../helpers/is-present";

export class CategoryJumbotron extends Component {
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

  get showCategoryLogo() {
    return settings.show_category_logo;
  }

  get hasLightAndDarkLogo() {
    return (
      this.category.uploaded_logo?.url && this.category.uploaded_logo_dark?.url
    );
  }

  @computed("category", "currentRoutesMatch")
  get displayJumbotron() {
    return (
      this.currentRoutesMatch &&
      this.category &&
      this.validCategoryLevel &&
      this.validCategoryName &&
      this.validCategoryDescription
    );
  }

  get validCategoryLevel() {
    return this.category?.level <= settings.max_level;
  }

  get validCategoryName() {
    return !settings.exceptions.includes(this.category?.name);
  }

  get validCategoryDescription() {
    return (
      settings.hide_if_no_description || isPresent(this.category?.description)
    );
  }

  get hasIconComponent() {
    return getOwner(this).hasRegistration("component:category-icon");
  }

  get categoryIconComponent() {
    return this.hasIconComponent ? "category-icon" : null;
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

  get categoryDescriptionSafe() {
    return htmlSafe(this.category.description);
  }

  routeNames(route) {
    if (route) {
      return [...this.routeNames(route.parent), route.name];
    }
    return [];
  }

  <template>
    {{#if this.displayJumbotron}}
      <div
        class="category-jumbotron {{this.safeClass}}"
        style={{this.safeStyle}}
      >
        <div class="category-jumbotron__grid">
          {{#if this.showCategoryLogo}}
            <div class="category-jumbotron__grid__logo aspect-image">
              {{#if this.hasLogo}}
                <LightDarkImg
                  @lightImg={{@category.uploaded_logo}}
                  @darkImg={{@category.uploaded_logo_dark}}
                />
              {{else if this.category.uploaded_logo_placeholder.url}}
                <CdnImg @src={{this.category.uploaded_logo_placeholder.url}} />
              {{/if}}
            </div>
          {{/if}}
          <div class="category-jumbotron__grid__content">
            <div class="category-jumbotron__grid__content__heading">
              <h2 class="category-jumbotron__grid__content__heading__name">
                {{#if this.categoryIconComponent}}
                  {{! For compatibility with https://meta.discourse.org/t/category-icons/104683}}
                  <this.categoryIconComponent @category={{@category}} />
                {{/if}}
                {{#if this.displayLockIcon}}
                  {{icon "lock"}}
                {{/if}}
                {{this.category.name}}
              </h2>
            </div>
            {{#if this.displayCategoryDescription}}
              <div class="category-jumbotron__grid__content__description">
                <div class="cooked">
                  {{this.categoryDescriptionSafe}}
                </div>
              </div>
            {{/if}}
          </div>
        </div>
      </div>
    {{/if}}
  </template>
}
