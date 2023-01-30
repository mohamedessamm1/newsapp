abstract class newsstate {}

class newsinitial extends newsstate {}

class newsbottomchange extends newsstate {}

class newsloadingbusnissstate extends newsstate {}

class newsgetbusnisssuccesstate extends newsstate {}

class newsgetbusnisserrorstate extends newsstate {
  final String error;
  newsgetbusnisserrorstate(this.error);
}

class newsloadingsports extends newsstate {}

class newsgetsuccessports extends newsstate {}

class newsgeterrorsports extends newsstate {
  final String error;
  newsgeterrorsports(this.error);
}

class newsgetloadingtech extends newsstate {}

class newsgetsuccestech extends newsstate {}

class newsgeterrortech extends newsstate {
  final String error;
  newsgeterrortech(this.error);
}

class changemodestate extends newsstate {}

class newsgetloadingtsearch extends newsstate {}

class newsgetsuccessearch extends newsstate {}

class newsgeterrorsearch extends newsstate {
  final String error;
  newsgeterrorsearch(this.error);
}
