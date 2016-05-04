%Matlab file for sysid_data (HW3 Q 6.11)
Als = (X')\(Y');
Als = Als';

norm(Als*X - Y)
norm(Y)