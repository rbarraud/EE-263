% term_by_doc.m
%
% ee263, autumn 1999/2000, final exam
%
% test data for the search engine problem
%
% defines:
%
% term     -- indexed words (list of strings)
% document -- web page URLs (list of strings)
% A        -- term-by-document matrix (frequencies)
% m        -- number of terms
% n        -- number of documents

term = {
	'appointments',
	'requirements',
	'required',
	'university',
	'medical',
	'available',
	'financial',
	'college',
	'acrobat',
	'teaching',
	'located',
	'handbook',
	'affairs',
	'updated',
	'graduate',
	'research',
	'chapter',
	'members',
	'council',
	'subject',
	'service',
	'education',
	'policies',
	'background',
	'section',
	'training',
	'program',
	'faculty',
	'individual',
	'document',
	'content',
	'stanford',
	'committee',
	'services',
	'application',
	'quarter',
	'department',
	'version',
	'provider',
	'student',
	'employees',
	'programs',
	'following',
	'personnel',
	'president',
	'procedures',
	'statement',
	'undergraduate',
	'resources',
	'information',
	'courses',
	'portfolio',
	'students',
	'departments',
	'without',
	'registrar',
	'professor',
	'appointment',
	'provost',
	'activities',
	'commonground',
	'administrative',
	'administration',
	'academic',
};

document = {
	'http://www-portfolio.stanford.edu/0',
	'http://www-portfolio.stanford.edu/100156',
	'http://www-portfolio.stanford.edu/100111',
	'http://www-portfolio.stanford.edu/100852',
	'http://www-portfolio.stanford.edu/100991',
	'http://www-portfolio.stanford.edu/100999',
	'http://www-portfolio.stanford.edu/100102',
	'http://www-portfolio.stanford.edu/104201',
	'http://www-portfolio.stanford.edu/100106',
	'http://www-portfolio.stanford.edu/100397',
	'http://www-portfolio.stanford.edu/100826',
	'http://www-portfolio.stanford.edu/101213',
	'http://www-portfolio.stanford.edu/105262',
	'http://www-portfolio.stanford.edu/104336',
	'http://www-portfolio.stanford.edu/104285',
	'http://www-portfolio.stanford.edu/104284',
	'http://www-portfolio.stanford.edu/105198',
	'http://www-portfolio.stanford.edu/106043',
	'http://www-portfolio.stanford.edu/100427',
	'http://www-portfolio.stanford.edu/103526',
	'http://www-portfolio.stanford.edu/105043',
	'http://www-portfolio.stanford.edu/105732',
	'http://www-portfolio.stanford.edu/105733',
	'http://www-portfolio.stanford.edu/105734',
	'http://www-portfolio.stanford.edu/105735',
	'http://www-portfolio.stanford.edu/105736',
	'http://www-portfolio.stanford.edu/105737',
	'http://www-portfolio.stanford.edu/105738',
	'http://www-portfolio.stanford.edu/105739',
	'http://www-portfolio.stanford.edu/105740',
	'http://www-portfolio.stanford.edu/105741',
	'http://www-portfolio.stanford.edu/105742',
	'http://www-portfolio.stanford.edu/105743',
	'http://www-portfolio.stanford.edu/105744',
	'http://www-portfolio.stanford.edu/105745',
	'http://www-portfolio.stanford.edu/105823',
	'http://www-portfolio.stanford.edu/105824',
	'http://www-portfolio.stanford.edu/105825',
	'http://www-portfolio.stanford.edu/105826',
	'http://www-portfolio.stanford.edu/105827',
	'http://www-portfolio.stanford.edu/105828',
	'http://www-portfolio.stanford.edu/105746',
	'http://www-portfolio.stanford.edu/105829',
	'http://www-portfolio.stanford.edu/105747',
	'http://www-portfolio.stanford.edu/200005',
	'http://www-portfolio.stanford.edu/100381',
	'http://www-portfolio.stanford.edu/100395',
	'http://www-portfolio.stanford.edu/101308',
	'http://www-portfolio.stanford.edu/105215',
	'http://www-portfolio.stanford.edu/102198',
	'http://www-portfolio.stanford.edu/105653',
	'http://www-portfolio.stanford.edu/104012',
	'http://www-portfolio.stanford.edu/100430',
	'http://www-portfolio.stanford.edu/102200',
	'http://www-portfolio.stanford.edu/100308',
	'http://www-portfolio.stanford.edu/100383',
	'http://www-portfolio.stanford.edu/100399',
	'http://www-portfolio.stanford.edu/100384',
	'http://www-portfolio.stanford.edu/200126',
	'http://www-portfolio.stanford.edu/200033',
	'http://www-portfolio.stanford.edu/200034',
	'http://www-portfolio.stanford.edu/100167',
	'http://www-portfolio.stanford.edu/100651',
	'http://www-portfolio.stanford.edu/100398',
	'http://www-portfolio.stanford.edu/105351',
	'http://www-portfolio.stanford.edu/104173',
	'http://www-portfolio.stanford.edu/100369',
	'http://www-portfolio.stanford.edu/104175',
	'http://www-portfolio.stanford.edu/104174',
	'http://www-portfolio.stanford.edu/103743',
	'http://www-portfolio.stanford.edu/106217',
	'http://www-portfolio.stanford.edu/105176',
	'http://www-portfolio.stanford.edu/106229',
	'http://www-portfolio.stanford.edu/104919',
	'http://www-portfolio.stanford.edu/104034',
	'http://www-portfolio.stanford.edu/105985',
	'http://www-portfolio.stanford.edu/103995',
	'http://www-portfolio.stanford.edu/103996',
	'http://www-portfolio.stanford.edu/103744',
	'http://www-portfolio.stanford.edu/103745',
	'http://www-portfolio.stanford.edu/103664',
	'http://www-portfolio.stanford.edu/103673',
	'http://www-portfolio.stanford.edu/103762',
	'http://www-portfolio.stanford.edu/103674',
	'http://www-portfolio.stanford.edu/103672',
	'http://www-portfolio.stanford.edu/103668',
	'http://www-portfolio.stanford.edu/104003',
	'http://www-portfolio.stanford.edu/105338',
	'http://www-portfolio.stanford.edu/103948',
	'http://www-portfolio.stanford.edu/103946',
	'http://www-portfolio.stanford.edu/103957',
	'http://www-portfolio.stanford.edu/104323',
	'http://www-portfolio.stanford.edu/105369',
	'http://www-portfolio.stanford.edu/103956',
	'http://www-portfolio.stanford.edu/<a',
	'http://www-portfolio.stanford.edu/100101',
	'http://www-portfolio.stanford.edu/105378',
	'http://www-portfolio.stanford.edu/100691',
	'http://www-portfolio.stanford.edu/105756',
	'http://www-portfolio.stanford.edu/105091',
	'http://www-portfolio.stanford.edu/105432',
	'http://www-portfolio.stanford.edu/100401',
	'http://www-portfolio.stanford.edu/103536',
	'http://www-portfolio.stanford.edu/103560',
	'http://www-portfolio.stanford.edu/103561',
	'http://www-portfolio.stanford.edu/103562',
	'http://www-portfolio.stanford.edu/103563',
	'http://www-portfolio.stanford.edu/103564',
	'http://www-portfolio.stanford.edu/105412',
	'http://www-portfolio.stanford.edu/103593',
	'http://www-portfolio.stanford.edu/100107',
	'http://www-portfolio.stanford.edu/100135',
	'http://www-portfolio.stanford.edu/106020',
	'http://www-portfolio.stanford.edu/103352',
	'http://www-portfolio.stanford.edu/101252',
	'http://www-portfolio.stanford.edu/106100',
	'http://www-portfolio.stanford.edu/105218',
	'http://www-portfolio.stanford.edu/105220',
	'http://www-portfolio.stanford.edu/105223',
	'http://www-portfolio.stanford.edu/106106',
	'http://www-portfolio.stanford.edu/105227',
	'http://www-portfolio.stanford.edu/105216',
	'http://www-portfolio.stanford.edu/101026',
	'http://www-portfolio.stanford.edu/105217',
	'http://www-portfolio.stanford.edu/106031',
	'http://www-portfolio.stanford.edu/105103',
	'http://www-portfolio.stanford.edu/105104',
	'http://www-portfolio.stanford.edu/105105',
};

A = [
 0 0 0 6 0 2 1 0 0 1 0 2 0 0 0 9 0 0 2 0 0 0 4 1 0 1 1 7 0 0 0 31 0 6 0 1 0 0 0 4 0 1 0 1 1 3 0 0 2 22 0 24 3 4 0 0 0 0 0 0 0 1 2 4;
 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 14 0 0 0 0 0 0 0 0 0 0 1 0;
 0 0 0 2 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12 0 0 0 0 0 0 0 0 0 0 1 0;
 0 0 0 2 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 5 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 8 0 20 0 0 0 0 0 0 0 0 0 0 1 0;
 0 0 0 6 0 0 0 0 1 0 1 2 0 2 0 3 0 1 1 1 0 0 0 1 0 0 0 1 0 0 4 15 1 0 0 0 0 2 2 0 0 0 0 0 0 0 0 0 4 7 0 28 0 0 0 0 0 0 0 0 0 1 1 1;
 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 15 0 0 0 0 0 0 0 0 0 0 1 0;
 0 0 1 4 0 2 4 0 1 0 1 0 0 2 1 0 0 0 0 0 1 0 0 1 0 0 0 1 0 2 0 25 0 5 2 0 1 2 3 4 0 0 0 0 8 0 0 1 0 16 0 9 4 0 0 1 0 0 0 1 1 0 1 0;
 0 0 0 2 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 2 0 0 0 0 6 0 3 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 5 0 8 0 0 0 0 0 0 0 0 0 0 1 0;
 0 1 0 13 0 2 4 0 0 0 1 0 0 0 0 4 0 0 0 0 8 0 28 1 0 5 3 0 0 0 0 21 0 5 0 0 0 0 10 4 2 0 0 4 0 24 0 0 2 26 1 9 1 0 0 0 0 0 0 0 0 9 5 3;
 0 1 0 4 0 0 0 0 0 0 1 2 0 0 1 7 0 0 0 0 6 0 6 1 0 0 0 0 0 0 0 7 0 0 0 0 0 0 3 0 0 0 0 0 0 2 0 0 0 5 0 8 0 0 0 0 0 0 1 0 0 0 1 2;
 0 0 0 4 1 0 1 0 0 0 1 1 1 1 0 21 0 0 0 0 1 0 7 1 0 0 0 10 0 0 0 10 0 0 0 0 1 0 1 1 0 0 0 0 0 7 0 3 1 19 0 9 1 0 0 0 0 0 0 0 0 0 1 3;
 0 0 0 5 0 0 1 0 3 0 1 1 0 3 6 8 0 0 0 0 0 0 0 1 1 0 0 0 0 5 0 7 0 0 5 1 0 5 4 0 0 0 0 0 0 0 0 0 0 10 0 8 0 0 0 0 0 0 3 0 2 3 1 0;
 0 0 0 3 0 1 0 0 1 0 1 0 0 2 2 7 0 0 0 0 0 0 0 1 0 0 0 0 0 0 4 4 0 0 2 2 0 0 2 4 0 0 0 0 0 0 0 0 0 2 0 9 0 0 0 0 0 0 2 0 1 0 1 1;
 0 0 0 5 0 0 0 0 3 0 1 3 0 3 1 5 0 0 0 0 0 0 1 1 1 0 0 0 0 7 0 8 0 0 5 0 0 5 4 0 0 0 0 0 0 1 0 0 0 6 0 8 0 0 0 0 0 0 1 0 2 2 1 1;
 1 1 0 6 1 2 0 0 1 0 1 0 0 2 2 1 0 0 0 0 0 0 0 1 1 0 0 2 0 0 4 14 0 1 2 2 0 0 2 2 12 6 1 0 0 0 0 1 0 3 0 9 4 0 0 0 0 1 0 0 1 2 1 0;
 0 1 0 9 0 2 0 0 1 0 1 0 1 2 0 4 0 0 0 0 0 0 0 1 0 0 0 2 0 0 4 10 0 8 2 0 0 0 2 5 0 0 2 0 1 0 0 0 0 3 0 9 2 1 0 1 0 0 0 9 1 8 7 1;
 0 0 0 6 0 1 0 0 1 0 1 2 0 2 2 6 0 0 0 0 0 0 0 1 0 0 2 0 0 0 3 9 0 0 2 0 0 0 2 0 2 0 0 0 0 0 0 0 0 3 0 10 1 0 0 0 0 0 2 1 0 5 1 0;
 0 0 1 6 0 1 0 0 1 0 1 0 0 2 7 10 0 0 0 2 0 0 0 1 0 0 0 0 0 0 4 12 0 0 3 0 1 0 2 0 0 0 0 0 0 0 0 0 1 2 0 9 0 0 0 0 0 0 5 0 1 0 1 0;
 0 0 0 2 1 0 0 0 0 0 1 0 1 1 0 5 0 0 0 0 0 1 0 1 0 0 0 13 0 0 0 6 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 3 0 5 0 8 2 0 0 0 0 0 0 0 0 0 1 2;
 1 0 0 9 5 0 0 0 2 8 1 4 3 3 0 6 0 0 11 0 0 1 1 1 0 0 7 30 0 3 0 15 4 0 3 0 1 3 5 1 0 0 0 0 0 0 0 3 0 14 0 9 1 0 0 0 0 0 2 0 1 2 1 20;
 7 0 0 22 3 0 0 0 13 21 1 69 17 16 0 0 27 0 3 0 0 0 7 1 0 0 0 100 0 28 0 21 0 3 34 0 0 28 17 0 0 0 0 0 0 3 0 0 0 18 0 8 0 0 0 0 0 9 17 0 12 3 1 18;
 23 0 0 7 9 1 0 0 1 15 1 4 2 2 0 1 9 0 8 1 1 0 8 2 2 0 0 14 0 0 3 18 1 0 2 0 0 0 2 0 0 0 0 1 1 11 6 0 0 2 0 23 1 0 1 0 0 12 3 0 1 1 1 21;
 1 0 0 7 2 2 0 0 1 4 1 10 3 2 1 3 0 0 1 0 0 0 7 1 0 0 0 11 0 0 3 10 0 0 2 0 1 1 2 0 0 0 1 0 0 3 0 0 0 2 0 11 0 1 0 0 1 0 6 0 1 0 1 3;
 4 0 0 7 1 1 1 0 1 4 1 5 7 2 0 0 0 0 2 0 0 0 1 1 1 0 0 17 0 0 3 6 0 4 2 0 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 9 0 0 0 0 0 0 5 0 1 3 1 5;
 5 1 1 67 8 6 4 0 1 13 1 6 11 2 8 20 5 31 70 6 4 7 4 1 5 1 2 33 2 1 3 38 52 1 2 0 11 0 2 7 0 2 10 1 48 5 7 3 1 5 0 13 13 7 1 1 23 4 14 2 1 16 7 97;
 84 4 4 45 23 6 6 0 1 29 1 7 5 2 2 44 3 36 29 24 52 1 8 1 23 0 11 136 38 1 4 26 2 0 2 2 49 1 2 0 1 4 9 6 17 16 31 0 1 8 1 11 3 15 43 1 76 206 43 4 1 15 1 65;
 2 0 1 22 20 5 0 0 1 21 1 5 2 2 1 21 4 8 3 3 13 2 4 1 3 1 5 61 5 1 3 17 2 0 4 6 22 0 3 2 0 3 5 0 0 3 0 1 0 2 1 10 2 1 13 0 1 6 5 2 1 3 1 8;
 1 0 0 31 5 3 1 0 1 6 1 7 2 2 0 3 4 17 14 5 0 0 4 1 14 0 0 64 5 0 3 10 5 1 3 0 2 0 2 1 0 0 9 2 41 19 33 0 0 4 0 10 1 0 8 0 0 5 40 1 0 8 1 39;
 5 1 1 39 4 13 2 0 1 29 1 5 4 2 1 10 3 13 5 6 9 1 2 1 1 0 12 64 0 0 3 21 1 4 2 17 10 0 2 0 3 4 4 0 0 1 2 0 0 11 6 11 0 0 5 1 4 4 7 18 1 14 1 12;
 29 0 1 10 1 3 0 0 1 36 1 7 2 2 2 9 4 12 7 3 4 0 5 1 0 1 10 16 5 0 3 13 2 0 2 5 19 0 2 2 1 2 1 2 3 6 1 0 0 5 3 10 0 11 4 0 0 35 14 1 1 4 3 29;
 0 0 0 7 15 4 0 0 1 8 1 4 2 2 0 0 3 0 1 0 0 0 4 1 0 0 1 8 3 0 3 9 0 0 2 0 6 0 3 0 0 0 2 0 0 1 0 0 0 1 0 10 0 0 2 0 0 4 3 0 1 0 1 7;
 0 0 0 12 1 4 0 0 1 6 1 6 3 2 1 3 6 1 2 2 0 0 0 1 1 0 0 9 1 0 3 7 0 0 3 0 3 0 2 0 0 0 3 0 13 5 8 0 0 2 0 11 0 0 1 0 0 2 13 0 1 33 1 18;
 21 0 0 10 23 4 0 0 1 18 1 7 2 2 9 5 7 9 8 2 8 1 2 1 1 1 2 13 15 0 3 20 0 0 2 3 10 0 3 0 1 1 3 0 0 3 1 1 0 2 2 10 3 1 1 0 20 23 2 2 1 0 1 19;
 0 0 0 3 1 4 0 0 0 2 1 3 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 10 0 2 3 4 0 0 7 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 0 2 0 0 0 1 2;
 1 0 0 8 1 0 0 0 0 2 1 9 6 6 0 0 0 0 1 0 0 0 0 1 0 0 0 16 0 6 0 8 0 0 12 0 0 6 6 0 0 0 0 0 0 0 0 0 0 6 0 8 0 0 0 0 6 17 6 0 0 0 1 2;
 0 0 0 4 1 4 0 0 0 0 1 2 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 4 0 2 3 5 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 4 2 0 0 0 1 1;
 0 0 0 6 0 4 0 0 0 0 1 2 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 6 0 2 3 6 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 5 2 0 0 0 1 1;
 0 0 0 6 0 4 0 0 0 0 1 2 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 6 0 2 3 6 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 2 2 0 0 0 1 1;
 0 0 0 6 0 4 0 0 0 0 1 2 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 6 0 2 3 6 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 5 2 0 0 0 1 1;
 0 0 0 6 0 4 0 0 0 0 1 2 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 6 0 2 3 6 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 6 2 2 0 0 0 1 1;
 0 0 0 6 0 4 0 0 0 0 1 2 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 5 0 2 3 6 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 8 2 0 0 0 1 1;
 0 0 0 3 1 4 0 0 0 2 1 3 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 6 0 2 3 4 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 4 2 0 0 0 1 2;
 1 0 0 4 1 4 0 0 0 5 1 4 2 2 0 0 0 0 1 0 0 0 0 1 0 0 1 7 0 2 3 5 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 9 0 0 1 0 0 3 2 0 0 0 1 5;
 0 0 0 4 2 3 0 0 3 4 1 6 2 2 0 0 0 0 2 0 0 0 0 1 0 0 0 9 0 1 3 5 0 0 2 0 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 10 0 0 0 0 0 0 2 0 1 0 1 4;
 2 0 0 9 1 2 1 0 1 0 1 2 0 2 1 1 1 11 12 0 0 0 0 1 0 0 0 15 0 0 3 7 8 0 2 0 3 0 2 1 0 0 1 0 2 1 3 2 0 2 0 12 0 2 0 0 0 0 2 0 1 4 2 27;
 1 0 0 106 2 0 15 0 26 2 1 1 10 26 9 10 5 2 3 0 2 1 8 1 1 1 1 6 1 52 0 73 2 9 52 0 4 52 26 8 4 7 0 0 34 2 0 2 7 35 0 8 1 2 0 0 0 0 33 14 26 48 3 18;
 0 0 0 20 0 0 0 0 2 0 1 0 0 2 0 0 21 0 0 3 0 0 7 1 0 0 0 0 0 3 0 15 0 5 3 0 0 3 4 0 2 0 0 3 0 2 0 0 0 14 0 8 0 0 0 0 0 0 0 0 1 45 1 0;
 0 0 0 6 0 0 0 0 0 0 1 0 0 2 2 3 0 0 0 0 1 0 1 1 0 0 1 0 0 0 2 33 0 1 0 0 0 0 3 4 0 0 0 0 0 0 0 1 0 1 0 22 0 0 0 0 0 0 0 0 0 6 1 2;
 0 0 0 5 0 4 2 0 1 0 1 0 3 3 1 1 7 0 0 0 1 0 2 1 0 0 0 0 0 0 4 7 0 2 2 0 0 0 2 1 1 0 0 1 1 2 0 0 1 3 0 12 0 0 0 0 0 0 4 0 1 13 1 0;
 0 0 0 12 1 1 5 0 1 0 1 0 2 2 3 2 7 0 0 1 0 0 4 1 0 2 1 1 0 0 3 155 0 5 1 0 0 0 2 5 4 1 0 6 4 1 0 1 1 3 0 155 0 0 0 0 0 0 6 4 0 9 1 3;
 0 0 0 14 1 1 0 0 1 0 1 0 0 2 0 0 1 1 0 0 1 0 1 1 0 0 0 1 0 0 3 7 0 0 2 0 0 0 2 0 0 0 0 0 2 0 0 0 0 1 0 10 0 0 0 0 0 0 1 1 1 3 1 0;
 6 1 5 21 6 2 13 0 0 4 1 43 2 0 4 35 3 0 3 6 6 0 12 1 0 15 4 34 1 0 2 15 1 22 0 1 3 0 2 11 23 2 0 13 3 10 0 3 3 10 1 9 2 1 0 0 6 1 8 6 0 9 5 4;
 0 0 0 9 0 1 0 0 1 0 1 0 0 1 1 0 5 0 0 0 0 0 11 1 0 0 0 1 0 1 0 10 0 0 1 0 0 1 1 4 3 4 0 15 0 0 0 1 0 12 0 8 0 0 0 0 0 0 0 0 0 23 1 0;
 0 0 0 4 1 1 0 0 1 0 1 0 0 2 2 1 5 0 0 0 0 0 2 1 0 2 1 0 0 0 3 57 0 1 1 0 0 0 2 4 4 1 0 7 0 1 0 1 0 2 0 61 0 0 0 0 0 0 0 0 0 3 1 0;
 0 0 0 8 0 1 3 0 1 0 1 0 3 2 0 0 0 0 0 0 0 0 16 1 1 0 0 0 2 0 3 4 0 1 2 0 0 0 2 0 2 0 0 17 4 3 0 0 4 3 0 9 0 0 0 0 0 0 0 0 1 2 5 1;
 0 2 0 37 1 2 1 0 17 0 1 0 1 17 0 0 1 0 0 0 1 0 21 1 5 2 6 14 0 32 0 36 0 17 33 0 1 32 17 0 20 1 0 21 16 7 2 0 18 20 1 8 0 0 0 0 0 1 0 0 15 22 2 3;
 0 0 0 9 0 1 0 0 1 0 1 1 0 1 2 6 0 0 0 0 0 0 13 1 1 0 0 1 0 2 0 11 0 0 2 0 0 2 1 4 3 4 0 15 0 6 0 1 0 11 0 8 0 0 0 0 0 4 1 0 1 15 1 4;
 1 0 1 33 0 0 0 0 10 1 1 0 0 10 0 1 1 0 0 0 1 1 11 2 0 6 0 9 0 20 0 28 0 5 20 0 0 20 10 3 17 0 0 9 14 6 3 0 7 10 0 8 2 0 0 0 0 1 0 1 10 14 1 3;
 0 0 0 12 0 1 1 0 1 0 1 0 0 2 0 0 0 0 0 0 0 0 7 1 1 1 0 0 0 0 3 7 0 0 2 0 0 0 2 0 3 0 0 5 3 1 0 0 0 1 0 9 0 0 0 0 0 0 0 0 1 1 3 0;
 15 3 1 13 7 2 1 1 1 10 1 0 0 2 0 17 0 17 13 8 2 3 3 1 0 2 0 10 1 0 3 20 0 0 2 0 4 0 2 3 24 4 3 1 2 5 0 1 3 1 1 9 7 1 5 1 27 7 3 1 1 5 1 20;
 0 0 4 23 2 5 0 0 1 1 1 2 0 2 0 1 0 2 0 5 0 4 3 1 2 3 0 10 12 0 4 9 0 2 2 0 2 0 2 11 0 1 2 2 4 7 2 0 6 8 0 10 5 1 2 0 0 0 0 0 1 2 1 8;
 4 0 0 20 0 0 0 0 6 1 1 0 2 6 6 3 0 0 0 0 0 1 4 2 0 0 0 1 0 11 0 19 0 0 11 0 0 11 6 13 1 0 0 0 6 6 1 0 2 6 0 8 4 0 0 0 0 3 4 1 5 7 1 1;
 0 1 4 20 15 5 0 0 1 0 1 0 3 2 0 0 0 0 0 7 6 5 6 1 2 0 1 12 8 0 4 23 0 8 2 0 10 0 2 21 1 2 3 2 5 5 2 0 10 20 0 10 23 0 2 1 0 0 4 0 1 3 1 2;
 0 0 0 27 0 0 0 0 8 0 1 5 0 10 5 11 0 0 0 0 0 1 6 1 5 0 10 0 0 17 0 38 4 0 16 0 0 16 11 1 1 1 0 0 3 4 1 0 2 21 0 8 0 0 0 0 0 0 5 0 8 5 1 0;
 0 2 1 25 2 1 0 0 4 0 1 7 0 9 0 6 0 1 0 1 1 0 5 1 4 10 2 3 0 15 0 42 0 2 12 0 1 12 10 0 0 0 3 2 1 5 0 0 6 17 0 9 2 0 0 0 0 0 0 1 8 0 1 0;
 0 4 2 22 2 3 0 0 0 2 1 0 1 2 0 6 0 0 0 0 0 0 3 2 0 7 5 14 0 0 5 42 2 10 2 0 18 0 2 3 3 2 0 3 2 6 0 0 0 11 0 9 10 7 0 0 0 0 1 2 1 5 2 3;
 0 1 0 2 0 0 0 0 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 0 8 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 4 0 8 0 0 0 0 0 0 0 0 0 0 1 0;
 0 10 3 8 1 3 0 2 0 0 1 1 0 3 0 0 5 0 0 26 1 0 0 1 0 131 3 0 0 0 3 10 0 1 2 0 1 0 2 0 26 0 0 1 0 10 0 0 27 3 0 9 0 1 1 0 0 0 0 23 1 1 1 0;
 0 0 3 3 0 4 0 0 0 0 1 0 0 2 0 1 0 0 0 2 0 0 0 1 0 4 1 0 0 0 3 8 0 0 1 0 2 0 2 0 0 0 0 0 0 2 0 0 0 3 0 9 0 0 0 0 0 0 0 0 1 0 1 0;
 0 0 0 6 0 0 1 0 2 0 1 1 0 3 3 12 0 0 0 0 0 0 1 1 1 0 0 4 1 6 0 10 0 0 7 0 1 6 5 0 0 0 0 1 0 0 0 0 0 11 0 8 0 0 0 0 0 0 3 1 3 0 1 0;
 0 0 0 4 0 4 0 0 2 0 1 0 0 2 2 3 0 0 0 0 0 0 0 1 0 0 0 0 0 5 3 5 0 0 6 0 0 4 2 0 0 0 0 0 0 0 0 0 0 2 0 10 0 0 0 0 0 0 2 0 1 0 1 0;
 0 0 0 3 0 0 0 0 2 0 1 1 0 2 2 4 0 0 0 0 0 0 0 1 1 0 0 0 0 4 0 4 0 0 4 0 0 4 2 0 0 0 0 0 0 0 0 0 0 4 0 8 0 0 0 0 0 0 2 0 2 0 1 0;
 0 0 0 7 0 1 0 0 1 2 1 0 0 2 3 7 0 0 0 1 0 0 0 1 0 0 0 1 0 0 3 8 0 0 2 0 0 0 2 0 0 0 1 0 1 0 0 0 0 2 0 9 0 0 0 0 0 0 4 3 1 4 4 0;
 0 0 2 3 0 2 0 0 1 0 1 1 0 2 2 3 0 0 0 0 0 0 0 1 0 0 0 0 0 0 3 4 0 0 2 0 2 0 2 0 0 0 0 0 0 0 0 0 0 2 0 9 0 0 0 0 0 0 2 0 1 0 1 0;
 0 0 0 7 0 0 0 0 3 0 1 0 0 3 5 6 0 0 0 0 0 0 0 1 0 0 0 1 0 6 0 15 0 0 6 0 0 6 4 0 0 0 0 6 0 0 0 0 0 3 0 8 1 0 0 0 0 0 4 0 3 0 1 0;
 0 0 2 7 0 3 0 0 1 0 1 1 0 2 5 8 0 0 0 2 0 0 1 1 0 0 1 3 0 0 5 25 0 0 2 1 1 0 2 0 0 0 0 1 0 0 0 0 2 1 0 10 3 0 0 0 0 0 3 0 1 0 1 0;
 0 0 0 9 0 1 0 0 1 0 1 1 0 2 2 4 0 0 0 1 0 0 4 1 1 0 0 2 0 0 6 19 0 0 2 0 1 0 2 0 0 0 0 5 0 0 0 0 1 1 0 9 0 0 0 0 1 0 3 0 1 0 1 0;
 0 0 0 5 0 1 0 0 1 0 1 1 0 2 2 4 0 0 0 1 0 0 3 1 0 0 0 0 0 0 5 36 0 0 2 0 1 0 2 0 0 0 0 3 0 0 0 0 1 2 0 9 0 0 0 0 0 0 2 1 1 0 1 0;
 0 0 0 5 8 0 0 0 1 0 1 1 0 1 1 10 0 0 0 0 0 0 0 1 1 1 0 0 0 2 0 9 0 0 1 0 0 1 4 0 0 0 1 0 0 0 0 0 0 7 0 8 0 0 0 0 0 0 1 0 0 0 1 0;
 0 0 0 6 0 0 0 0 0 0 1 0 0 4 0 3 0 0 0 0 0 0 0 1 0 0 0 0 0 5 0 10 1 0 12 0 0 4 4 0 0 0 0 0 0 3 1 0 1 6 0 8 0 0 0 0 0 0 0 0 3 3 1 0;
 0 0 0 4 0 4 0 0 0 0 1 0 0 2 0 1 0 0 0 0 0 0 0 1 0 0 1 0 0 4 5 7 0 0 7 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 10 0 0 1 0 0 0 0 0 0 3 1 0;
 0 0 0 3 0 1 0 0 0 0 1 0 0 2 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 3 8 0 0 1 0 0 0 2 0 0 0 0 2 0 0 0 0 0 1 0 9 0 0 0 0 0 0 0 0 1 1 1 0;
 0 0 0 2 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 2 0 3 0 0 2 0 0 1 1 0 0 0 0 0 0 2 0 0 0 1 0 8 0 0 0 0 0 0 0 0 1 1 1 0;
 0 0 0 5 0 4 0 0 0 0 1 0 0 2 0 4 0 3 0 0 0 0 0 1 0 6 0 1 0 0 3 7 0 0 6 0 0 0 2 0 0 0 0 0 0 6 1 0 0 1 0 9 0 0 0 0 0 0 0 0 1 0 1 0;
 0 1 3 7 6 4 0 0 0 0 2 0 0 2 0 3 0 2 0 0 0 0 0 1 16 3 0 0 0 0 4 8 0 0 12 0 3 0 2 0 2 0 2 4 0 17 5 0 0 10 0 9 0 0 0 0 0 0 0 0 1 3 1 0;
 0 0 0 4 0 1 0 0 0 0 1 0 0 2 0 0 0 0 0 0 0 0 0 1 7 0 0 0 0 0 3 5 1 0 1 0 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 9 0 0 0 0 0 0 0 0 1 1 1 0;
 0 0 0 9 15 0 0 0 3 0 1 0 0 7 0 22 0 0 0 0 0 0 0 1 0 0 0 0 0 9 0 10 1 0 12 0 0 9 8 0 0 0 0 0 0 0 0 0 0 7 0 8 0 0 0 0 0 0 0 0 3 1 1 0;
 0 0 0 4 5 4 0 0 0 0 1 0 0 2 0 6 0 0 0 0 0 0 0 1 0 0 1 0 0 4 3 5 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 10 0 0 1 0 0 0 0 0 0 1 1 0;
 0 2 2 3 9 1 1 0 1 0 1 0 0 2 0 29 0 1 0 2 0 0 0 1 0 0 1 0 2 0 3 4 0 0 5 0 0 0 2 0 0 0 1 0 0 4 0 0 0 1 0 9 0 0 0 0 0 0 0 3 1 0 1 0;
 0 0 0 3 7 2 0 0 0 0 1 0 0 2 0 4 0 0 0 2 0 0 0 1 0 0 1 0 1 0 3 4 3 0 1 0 0 0 2 0 0 0 1 0 0 0 0 0 0 3 0 9 0 0 4 0 0 0 0 0 1 0 5 0;
 0 1 0 5 10 3 2 0 1 0 1 2 2 2 1 19 0 3 0 23 1 0 1 3 1 2 0 5 2 0 4 14 2 1 3 0 3 0 2 0 1 0 7 3 0 14 9 0 0 12 0 13 4 0 0 0 0 0 0 1 0 1 3 2;
 0 0 0 4 6 4 0 0 0 0 1 0 0 2 0 6 0 0 0 0 0 0 0 1 0 0 1 0 0 4 5 7 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 10 0 0 1 0 0 0 0 0 0 0 1 0;
 0 0 0 4 5 4 0 0 0 0 1 0 0 2 0 6 0 0 0 0 0 0 0 1 0 0 1 0 0 4 3 5 0 0 4 0 0 2 2 0 0 0 0 0 0 0 0 0 0 3 0 10 0 0 1 0 0 0 0 0 0 1 1 0;
 0 0 5 5 18 3 5 0 1 0 1 0 0 2 0 30 0 5 0 21 0 0 0 1 2 0 0 0 0 0 4 11 0 0 2 0 0 1 2 0 0 0 18 2 0 4 3 0 0 19 0 9 0 0 4 0 0 0 0 0 1 3 4 0;
 0 0 0 6 0 2 1 0 0 1 0 2 0 0 0 9 0 0 2 0 0 0 4 1 0 1 1 7 0 0 0 31 0 6 0 1 0 0 0 4 0 1 0 1 1 3 0 0 2 22 0 24 3 4 0 0 0 0 0 0 0 1 2 4;
 0 0 0 10 0 0 2 0 5 1 1 0 0 6 0 0 0 0 0 0 1 1 1 1 0 6 3 0 0 9 0 20 0 1 8 17 0 8 13 1 0 1 0 0 0 0 0 2 0 13 3 10 3 0 0 7 0 0 0 0 3 0 1 14;
 0 0 0 8 0 1 0 0 1 0 1 0 0 2 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 3 6 0 0 2 20 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 9 0 0 0 2 0 0 0 0 1 0 1 3;
 0 0 0 13 0 0 0 0 4 0 1 0 0 4 0 0 0 0 0 0 2 0 0 1 0 0 0 0 0 9 0 18 0 0 7 1 0 7 5 0 0 0 0 0 0 0 0 0 0 5 1 8 0 0 0 2 0 0 0 0 3 0 1 8;
 0 0 0 7 0 1 0 0 1 0 1 0 0 2 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 3 5 0 1 2 0 0 0 2 0 0 0 1 0 2 0 0 0 1 1 0 9 0 0 0 0 0 0 0 0 1 0 1 0;
 0 0 0 8 0 1 0 0 1 0 1 0 0 2 0 0 0 2 0 0 0 0 0 1 0 0 0 0 0 0 3 5 0 0 2 0 0 0 2 0 0 0 1 0 1 0 0 0 1 1 0 9 0 0 0 0 0 0 0 0 1 0 1 0;
 0 0 0 11 0 1 1 0 1 0 1 0 0 2 5 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 3 7 0 0 13 39 0 0 2 0 0 0 0 0 0 0 0 1 0 1 16 9 4 0 0 2 0 0 0 0 0 0 1 4;
 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 2 0 0 1 0 0 0 0 0 0 0 9 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 1 0;
 0 0 0 12 0 0 0 0 0 0 1 0 0 5 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 5 0 9 0 0 5 0 0 5 5 0 0 0 0 0 0 0 0 1 0 5 0 8 0 0 0 0 0 0 0 0 5 0 1 0;
 1 4 0 15 0 1 0 1 0 7 1 0 0 2 0 3 0 4 0 0 0 13 0 1 0 0 3 7 1 0 5 16 0 0 1 0 0 0 2 3 0 4 1 0 3 0 0 15 0 1 4 9 8 1 1 0 0 1 3 1 1 0 1 7;
 0 3 0 25 0 4 0 1 0 7 1 0 2 2 2 12 0 2 0 3 4 20 0 1 1 0 1 9 1 0 5 31 0 0 1 0 0 0 2 2 0 5 1 0 4 0 0 19 6 1 4 9 36 2 3 0 0 0 0 1 1 0 1 7;
 0 42 18 30 0 5 1 2 0 15 1 0 1 2 4 15 1 22 0 9 1 18 0 1 3 1 30 46 12 1 5 47 20 0 1 9 14 0 2 29 0 37 7 0 0 0 0 28 8 4 122 9 130 29 6 4 1 0 0 3 1 1 1 24;
 0 8 2 50 0 10 2 5 0 75 2 1 1 2 4 29 0 21 2 2 5 48 1 1 2 1 16 71 7 0 6 75 4 3 1 21 6 0 2 16 0 26 4 0 3 3 3 38 7 16 42 10 98 12 7 1 3 1 8 9 1 4 2 32;
 0 3 0 29 0 2 2 1 0 13 1 0 6 2 5 15 0 2 1 0 0 17 0 1 1 0 4 7 2 0 5 28 1 2 1 0 1 0 2 22 0 7 1 0 1 0 0 20 2 1 1 9 13 0 1 2 58 0 7 2 1 1 1 2;
 0 0 0 3 0 1 0 0 1 0 1 0 0 2 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 3 4 0 0 1 8 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 9 1 0 0 3 0 0 0 0 0 0 1 0;
 0 0 0 33 0 0 5 0 25 0 1 0 0 25 17 0 0 3 0 0 1 0 0 1 1 0 15 0 0 48 0 37 9 0 62 15 1 47 26 4 0 3 0 0 0 4 0 3 3 36 1 9 3 0 0 29 0 0 0 0 22 0 1 1;
 0 1 1 7 0 0 4 0 0 0 1 1 0 1 5 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 14 0 1 0 0 0 0 2 16 0 0 0 0 0 1 0 3 4 12 0 9 13 0 0 3 0 0 0 6 0 1 1 2;
 0 0 0 5 0 0 3 0 1 2 1 0 0 2 3 4 0 0 0 0 0 0 0 1 0 0 0 0 0 3 0 4 0 0 3 0 0 3 3 3 0 0 0 0 0 0 0 1 0 3 0 8 0 0 0 1 0 0 0 0 2 0 1 0;
 1 0 0 5 0 1 1 0 1 9 1 0 0 2 10 12 0 0 0 1 0 0 0 1 0 0 0 0 1 0 3 4 0 0 2 3 1 0 2 4 0 0 1 0 0 0 0 0 0 1 0 9 1 0 0 0 0 5 1 0 1 0 1 2;
 0 1 0 30 0 1 3 0 21 3 1 1 0 22 36 7 0 3 0 0 0 0 1 1 1 0 15 0 0 42 0 31 10 0 57 0 0 42 23 10 0 3 0 0 0 4 0 0 6 28 0 8 12 0 0 21 0 0 2 0 21 0 1 1;
 0 18 15 62 7 21 33 2 1 3 8 3 0 2 78 11 0 3 1 4 17 8 5 1 8 47 32 4 3 10 3 155 2 24 7 35 17 0 3 89 1 15 9 0 0 6 1 1 14 36 4 12 133 6 7 13 0 5 0 7 1 3 2 48;
 0 0 0 3 0 2 0 0 3 0 1 0 0 2 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 2 3 5 0 0 5 0 0 1 2 0 0 0 0 0 0 0 0 0 0 2 0 10 1 0 0 3 0 0 0 0 1 0 1 0;
 0 0 0 3 0 2 0 0 3 0 1 0 0 2 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 2 3 5 0 0 5 0 0 1 2 0 0 0 0 0 0 0 0 0 0 2 0 10 1 0 0 3 0 0 0 0 1 0 1 0;
 0 0 0 3 0 2 0 0 3 0 1 0 0 2 1 0 0 0 0 0 0 0 0 1 0 0 3 0 0 2 3 5 0 0 5 0 0 1 2 0 0 0 0 0 0 0 0 0 0 2 0 10 1 0 0 3 0 0 0 0 1 0 1 0;
 0 0 0 3 0 1 0 0 3 0 1 0 0 2 4 0 0 0 0 0 0 0 0 1 1 0 0 0 0 1 3 4 0 0 5 0 0 0 2 0 0 0 0 0 0 0 0 0 0 2 0 10 1 0 0 3 0 0 0 0 1 0 1 0;
 0 12 0 7 0 1 0 0 1 0 1 0 1 2 15 1 0 0 0 1 1 0 2 1 1 0 16 0 0 0 3 11 1 0 11 15 8 0 2 6 0 5 1 0 0 6 1 12 0 1 6 9 11 3 0 4 0 0 0 0 1 0 1 1;
 0 0 0 3 3 1 2 0 1 0 1 0 0 2 5 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 3 5 0 0 2 0 0 0 2 6 0 0 0 0 0 0 0 0 0 1 0 9 3 0 0 3 0 0 0 0 1 0 1 0;
 0 0 0 3 0 2 0 0 3 0 1 0 0 2 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 2 3 5 3 0 2 0 0 1 2 0 0 0 0 0 0 0 0 0 0 2 0 10 1 0 0 3 0 0 0 0 1 0 1 0;
 0 12 10 31 0 7 2 0 1 0 1 4 0 2 35 8 1 0 0 1 3 5 0 2 6 0 5 0 1 0 7 20 21 0 9 20 19 0 2 9 0 0 13 0 0 2 3 0 0 4 0 9 14 2 1 6 0 0 0 0 1 0 1 1;
 0 0 0 3 0 2 0 0 3 0 1 0 0 2 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 2 3 5 3 0 2 0 0 1 2 0 0 0 0 0 0 0 0 0 0 2 0 10 1 0 0 3 0 0 0 0 1 0 1 0;
 0 0 2 4 0 2 4 0 1 0 1 0 1 2 3 0 0 0 0 0 1 0 0 1 0 0 0 0 1 0 3 7 0 0 2 0 1 0 2 2 0 0 0 0 0 0 3 0 3 2 0 9 2 0 0 3 0 0 0 0 1 0 1 1;
 0 2 0 5 0 0 1 0 3 0 1 0 0 3 13 0 0 0 0 0 0 1 0 1 0 0 0 0 0 5 0 14 0 0 5 0 1 3 4 0 0 1 0 0 0 0 3 0 1 5 0 8 1 0 0 4 0 0 0 0 0 0 1 0;
 0 35 48 783 15 55 32 279 1 8 5 0 1 3 104 15 0 4 2 24 7 39 3 3 15 3 57 7 3 5 4 173 7 27 89 18 59 1 2 43 1 65 16 0 0 5 10 2 12 48 12 9 113 25 14 12 1 1 0 3 0 3 4 33;
 0 0 0 3 0 2 0 0 5 0 1 0 0 2 6 0 0 0 0 0 0 0 0 1 0 0 0 0 0 2 3 6 0 0 3 0 0 0 2 0 0 0 0 0 0 0 0 0 0 1 0 10 0 0 0 2 0 0 0 0 0 0 1 0;
]';

[m,n] = size(A);
