# Basic Instagram Style BottomTabNavigation

## Instagram style bottom navigation bar (user’s view)

- The bottom navigation bar is almost always visible
  - Even if you navigate within the tab, the tab is still visible
  - When using the photo upload function, the bottom navigation bar is not visible.

- Each tab maintains its own navigation state even when moving between tabs

- Tap a tab twice to return to the initial state of that tab

## Instagram style bottom navigation bar (flutter’s view)

- The bottom navigation bar is almost always visible
  - Even if you navigate within the tab, the tab is still visible ☛  Navigation happens inside each tab
  - When using the photo upload function, the bottom navigation bar is not visible ☛ Need a root navigator

- Each tab maintains its own navigation state even when moving between tabs
  - ☛ Each tab has its own navigation stack

- Tap a tab twice to return to the initial state of that tab
  - ☛ kind of so called popToTop (note: popToTop is a non-existent method)

## Very Basic Example
- Mainly focused on usages
- Step-by-step approach

- Point to note
  - Navigator widget
  - Navigator widget itself
  - rootNavigator option

- IndexedStatck
  - Shows only one of its children at a time
  - Preserves the state of all the children
  - https://www.youtube.com/watch?v=uV4eUXEezBw (HeavyFran’s IndexedStack)

- onWillPopScope (Android only)
  - https://www.youtube.com/watch?v=18rWsO7YfGw
