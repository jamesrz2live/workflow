#!/bin/sh
. ${0%/*}/utils.sh

aces_root="/data/aces"
aces_module_path="$aces_root/aces"
aces_source="$aces_root/source"
aces_scripts="$aces_module_path/scripts"
aces_protos="$aces_scripts/proto"
aces_source_generated="$aces_module_path/source/generated"

_eval mkdir -p "$aces_protos" || report_error "Failed to create path '$aces_protos' (code: $?)."
_eval mkdir -p "$aces_source_generated" || report_error "Failed to create path '$aces_source_generated' (code: $?)."

print_header "Moving proto files"
protos=`find $aces_source -not -iwholename "*/game/bundle/*" -not -iwholename "*/abengine/*" -not -iwholename "*/z2common/*" -name "*.proto"`
echo "Found $(echo $protos | wc -w)"
for p in $protos;
do
    _eval mv -v "$p" "$aces_protos" || report_error "Failed to move '$p' to '$aces_protos' (code: $?)."
done

print_header "Moving generated source files"
generated_src=`find $aces_source -not -iwholename "*/abengine/*" -not -iwholename "*/z2common/*" \( -name "*.pb.h" -o -name "*.pb.cc" \)`
echo "Found $(echo $generated_src | wc -w)"
for g in $generated_src
do
    _eval mv -v "$g" "$aces_source_generated" || report_error "Failed to move '$g' to '$aces_source_generated' (code: $?)."
done

print_header "Fixing proto imports"
for p in $(find $aces_protos -name "*.proto")
do
    _eval sed -ie 's#"game/[a-zA-Z0-9\/]*/\([a-zA-Z0-9]*\).proto"#"\1.proto"#' $p || report_error "Failed to edit imports for '$p' (code: $?)."
done

