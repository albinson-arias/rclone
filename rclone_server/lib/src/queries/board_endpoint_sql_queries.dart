const getUsersSQLQuery = '''
  SELECT username
  FROM board_pixels
  GROUP BY username
  ORDER BY MAX(id) DESC;
''';
