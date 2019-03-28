Name:           flat-remix-gtk
Version: 20190328
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
%{_datadir}/themes/Flat-Remix-GTK
%{_datadir}/themes/Flat-Remix-GTK-Dark
%{_datadir}/themes/Flat-Remix-GTK-Darker
%{_datadir}/themes/Flat-Remix-GTK-Darker-Solid
%{_datadir}/themes/Flat-Remix-GTK-Darkest
%{_datadir}/themes/Flat-Remix-GTK-Darkest-Solid
%{_datadir}/themes/Flat-Remix-GTK-Darkest-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Darkest-Solid-NoBorder
%{_datadir}/themes/Flat-Remix-GTK-Dark-Solid
%{_datadir}/themes/Flat-Remix-GTK-Solid

