#!/bin/bash
# Florida Sealcoating - SEO Fixes
# Run this from your client-review folder in Claude Code

echo "=== STEP 1: FIXING TITLE TAGS (10 files) ==="

# sealcoating.html (73 → 43 chars)
sed -i 's#<title>Sealcoating Services Orlando FL | Asphalt Protection | Florida Sealcoating</title>#<title>Sealcoating Orlando FL | Asphalt Protection</title>#g' sealcoating.html
echo "✓ sealcoating.html"

# residential.html (72 → 54 chars)
sed -i 's#<title>Residential Asphalt Services Orlando FL | Driveway Sealcoating \& Paving</title>#<title>Driveway Sealcoating \& Paving Orlando | Free Estimates</title>#g' residential.html
echo "✓ residential.html"

# asphalt-paving.html (75 → 52 chars)
sed -i 's#<title>Asphalt Paving Orlando FL | Driveways \& Parking Lots | Florida Sealcoating</title>#<title>Asphalt Paving Orlando FL | Driveways \& Parking Lots</title>#g' asphalt-paving.html
echo "✓ asphalt-paving.html"

# asphaltstriping.html (86 → 47 chars)
sed -i 's#<title>Parking Lot Striping Orlando FL | Line Marking \& ADA Compliance | Florida Sealcoating</title>#<title>Parking Lot Striping Orlando FL | ADA Compliant</title>#g' asphaltstriping.html
echo "✓ asphaltstriping.html"

# asphaltrepair.html (78 → 46 chars)
sed -i 's#<title>Asphalt Repair Orlando FL | Pothole \& Patching Services | Florida Sealcoating</title>#<title>Asphalt Repair Orlando FL | Pothole \& Patching</title>#g' asphaltrepair.html
echo "✓ asphaltrepair.html"

# crack-sealing.html (75 → 44 chars)
sed -i 's#<title>Crack Sealing Orlando FL | Hot Rubber Asphalt Repair | Florida Sealcoating</title>#<title>Crack Sealing Orlando FL | Hot Rubber Repair</title>#g' crack-sealing.html
echo "✓ crack-sealing.html"

# additionalservices.html (75 → 51 chars)
sed -i 's#<title>Additional Services Orlando FL | Curbs, Signs \& More | Florida Sealcoating</title>#<title>Additional Asphalt Services Orlando | Curbs \& Signs</title>#g' additionalservices.html
echo "✓ additionalservices.html"

# services.html (81 → 50 chars)
sed -i 's#<title>Asphalt Services Orlando FL | Sealcoating, Paving \& Repair | Florida Sealcoating</title>#<title>Asphalt Services Orlando FL | Sealcoating \& Paving</title>#g' services.html
echo "✓ services.html"

# locations/orlando.html (70 → 49 chars)
sed -i 's#<title>Orlando Asphalt Services | Sealcoating \& Paving | Florida Sealcoating</title>#<title>Asphalt Services Orlando FL | Florida Sealcoating</title>#g' locations/orlando.html
echo "✓ locations/orlando.html"

# locations/sanford.html (70 → 49 chars)
sed -i 's#<title>Sanford Asphalt Services | Sealcoating \& Paving | Florida Sealcoating</title>#<title>Asphalt Services Sanford FL | Florida Sealcoating</title>#g' locations/sanford.html
echo "✓ locations/sanford.html"

echo ""
echo "=== STEP 2: REMOVING BROKEN LOCATION LINKS ==="

# Remove from all root-level HTML files
for file in *.html; do
  # Nav dropdown links
  sed -i '/<a href="locations\/altamonte-springs.html">Altamonte Springs<\/a>/d' "$file"
  sed -i '/<a href="locations\/oviedo.html">Oviedo<\/a>/d' "$file"
  sed -i '/<a href="locations\/winter-springs.html">Winter Springs<\/a>/d' "$file"
  
  # Footer list items
  sed -i '/<li><a href="locations\/altamonte-springs.html">Altamonte Springs<\/a><\/li>/d' "$file"
  sed -i '/<li><a href="locations\/oviedo.html">Oviedo<\/a><\/li>/d' "$file"
  sed -i '/<li><a href="locations\/winter-springs.html">Winter Springs<\/a><\/li>/d' "$file"
done
echo "✓ Root HTML files cleaned"

# Remove multi-line area-pill blocks from index.html
sed -i '/<a href="locations\/altamonte-springs.html" class="area-pill">/,/<\/a>/d' index.html
sed -i '/<a href="locations\/oviedo.html" class="area-pill">/,/<\/a>/d' index.html
echo "✓ index.html area-pills removed"

# Remove from location pages (relative paths)
for file in locations/orlando.html locations/sanford.html; do
  sed -i '/<li><a href="altamonte-springs.html">Altamonte Springs<\/a><\/li>/d' "$file"
  sed -i '/<li><a href="oviedo.html">Oviedo<\/a><\/li>/d' "$file"
  sed -i '/<li><a href="winter-springs.html">Winter Springs<\/a><\/li>/d' "$file"
done
echo "✓ Location pages cleaned"

echo ""
echo "=== VERIFICATION ==="
echo "Checking for remaining broken links..."
if grep -rq "altamonte-springs.html\|oviedo.html\|winter-springs.html" *.html locations/*.html 2>/dev/null; then
  echo "⚠️  Some links may still exist:"
  grep -rn "altamonte-springs.html\|oviedo.html\|winter-springs.html" *.html locations/*.html
else
  echo "✓ All broken location links removed!"
fi

echo ""
echo "=== ALL FIXES COMPLETE ==="
