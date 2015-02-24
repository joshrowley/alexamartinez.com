ship:
	roots clean
	roots compile -e production
	ship public -to netlify
