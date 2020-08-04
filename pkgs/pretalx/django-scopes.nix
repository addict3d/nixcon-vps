{ stdenv, python, buildPythonPackage, fetchPypi
, tox, django, pytest-django
}:
buildPythonPackage rec {
  pname = "django-scopes";
  version = "1.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1c4vdqzp5l261inr833ygzzmbh5nlsys8bb1w5v95ybm2488dp6i";
  };

  #propagatedBuildInputs = [
    #django
  #];

  checkInputs = [
    tox
    django
    #pytest-django
  ];

  meta = with stdenv.lib; {
    description = "Safely separate multiple tenants in a Django database";
    homepage = "https://github.com/raphaelm/django-scopes";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}
