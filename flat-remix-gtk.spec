Name:           flat-remix-gtk
Version: 20220627
Release:        1
License:        GPLv3
Summary:        Flat Remix GTK theme
Url:            https://drasite.com/flat-remix-gtk
Group:          User Interface/Desktops
Source:         https://github.com/daniruiz/%{name}/archive/%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
BuildRequires:  make

%description
Flat Remix GTK theme is a pretty simple gtk window theme inspired on material design following a modern design using "flat" colors with high contrasts and sharp borders.


%prep
%setup -q

%install
%make_install

%build


%post


%postun


%files
%doc LICENSE README.md
%{_datadir}/themes/Flat-Remix*

