Name:           flat-remix-gtk
Version: 20190526
Release:        1
License:        GPLv3
Summary:        Flat Remix GTK theme
Url:            https://drasite.com/flat-remix-gtk
Group:          User Interface/Desktops
Source:         https://github.com/daniruiz/%{name}/archive/%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch

%description
Flat Remix GTK theme is a pretty simple gtk window theme inspired on material design following a modern design using "flat" colors with high contrasts and sharp borders.

Themes:
 • Flat Remix GTK
 • Flat Remix GTK Dark
 • Flat Remix GTK Darker
 • Flat Remix GTK Darkest

Variants:
 • Solid: Theme without transparency
 • No Border: Darkest theme without white window border


%prep
%setup -q

%install
%make_install

%build


%post


%postun


%files
%defattr(-,root,root)
%doc LICENSE README.md
%{_datadir}/themes/Flat-Remix-GTK-Blue
%{_datadir}/themes/Flat-Remix-GTK-Blue-Dark
%{_datadir}/themes/Flat-Remix-GTK-Blue-Darker
%{_datadir}/themes/Flat-Remix-GTK-Blue-Darker-Solid
%{_datadir}/themes/Flat-Remix-GTK-Blue-Darkest
%{_datadir}/themes/Flat-Remix-GTK-Blue-Darkest-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Blue-Darkest-Solid
%{_datadir}/themes/Flat-Remix-GTK-Blue-Darkest-Solid-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Blue-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Blue-Solid
%{_datadir}/themes/Flat-Remix-GTK-Green
%{_datadir}/themes/Flat-Remix-GTK-Green-Dark
%{_datadir}/themes/Flat-Remix-GTK-Green-Darker
%{_datadir}/themes/Flat-Remix-GTK-Green-Darker-Solid
%{_datadir}/themes/Flat-Remix-GTK-Green-Darkest
%{_datadir}/themes/Flat-Remix-GTK-Green-Darkest-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Green-Darkest-Solid
%{_datadir}/themes/Flat-Remix-GTK-Green-Darkest-Solid-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Green-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Green-Solid
%{_datadir}/themes/Flat-Remix-GTK-Red
%{_datadir}/themes/Flat-Remix-GTK-Red-Dark
%{_datadir}/themes/Flat-Remix-GTK-Red-Darker
%{_datadir}/themes/Flat-Remix-GTK-Red-Darker-Solid
%{_datadir}/themes/Flat-Remix-GTK-Red-Darkest
%{_datadir}/themes/Flat-Remix-GTK-Red-Darkest-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Red-Darkest-Solid
%{_datadir}/themes/Flat-Remix-GTK-Red-Darkest-Solid-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Red-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Red-Solid
%{_datadir}/themes/Flat-Remix-GTK-Yellow
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Dark
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Darker
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Darker-Solid
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Darkest
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Darkest-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Darkest-Solid
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Darkest-Solid-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Yellow-Solid

